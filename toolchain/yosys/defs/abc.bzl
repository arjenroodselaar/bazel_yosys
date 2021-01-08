"""
A rule to wrap formal ABC tasks as Bazel tests.
"""

load("//toolchain:rules.bzl", "tool", "verilog")
load("//toolchain/yosys:defs/yosys.bzl", "ys_write_aiger", "ys_write_smt2")


_DEFAULT_MODE = "bmc"
_DEFAULT_SOLVER = "bmc3"
_DEFAULT_WITNESS_SOLVER = "yices"
_DEFAULT_DEPTH = 20
_DEFAULT_APPEND = 0
_DEFAULT_MULTICLOCK = False
_DEFAULT_SYN = False
_DEFAULT_STBV = False
_DEFAULT_STDT = False
_DEFAULT_PRESAT = True
_DEFAULT_UNROLL = None

_TRACE_FMT = "$TEST_UNDECLARED_OUTPUTS_DIR/{}.{}"


def _trace_args(fmt):
    return [
        "--dump-vcd",
        _TRACE_FMT.format(fmt, "vcd"),
        "--dump-vlogtb",
        _TRACE_FMT.format(fmt, "v"),
        "--dump-smtc",
        _TRACE_FMT.format(fmt, "smtc"),
    ]

def _impl(ctx):
    bmc = (ctx.attr.mode == "bmc")
    prove = (ctx.attr.mode == "prove")

    bmc3 = (ctx.attr.solver == "bmc3")
    sim3 = (ctx.attr.solver == "sim3")
    pdr = (ctx.attr.solver == "pdr")

    yices = (ctx.attr.witness_solver == "yices")
    z3 = (ctx.attr.witness_solver == "z3")
    boolector = (ctx.attr.witness_solver == "boolector")

    if not (bmc3 or sim3 or pdr):
        fail("only bmc3, sim3 and pdr solvers are supported by ABC")

    if bmc and not (bmc3 or sim3):
        fail("bmc only supported with bmc3 and sim3 solvers")

    if prove and not pdr:
        fail("prove only supported with pdr solver")

    toolchain = ctx.toolchains["//toolchain/yosys:toolchain_type"].toolchaininfo

    aig_model, aig_map = ys_write_aiger(  # An Aiger model has two output files (witness, map)
        ctx = ctx,
        toolchain = toolchain,
        name = ctx.label.name + ".aig",
        mode = ctx.attr.mode,
        srcs = ctx.files.srcs,
        deps = ctx.files.deps,
        preamble = ctx.attr.yosys_preamble,
        arguments = ctx.attr.yosys_arguments,
        multiclock = ctx.attr.multiclock,
        nomem = True,
    )

    if not (aig_model.short_path.endswith(".aig") and aig_map.short_path.endswith("aim")):
        fail("Model/map file extensions are wrong. Maybe output order cannot be relied on?")

    witness_model = ys_write_smt2(
        ctx = ctx,
        toolchain = toolchain,
        name = ctx.label.name + ".smt2",
        mode = ctx.attr.mode,
        srcs = ctx.files.srcs,
        deps = ctx.files.deps,
        preamble = ctx.attr.yosys_preamble,
        arguments = ctx.attr.yosys_arguments,
        multiclock = ctx.attr.multiclock,
        nomem = True,
        syn = False,
        stbv = ctx.attr.stbv,
        stdt = ctx.attr.stdt,
    )

    witness_solver = None
    if yices:
        witness_solver = toolchain.yices_smt2
    elif z3:
        witness_solver = toolchain.z3
    elif boolector:
        witness_solver = toolchain.boolector

    abc_cmds = [
        "read_aiger " + aig_model.short_path,
        "fold",
        "strash",
    ]

    # Construct the solver command
    solver_cmd = [
        ctx.attr.solver,
        "-v",
    ]
    if ctx.attr.solver != "pdr":
        solver_cmd.extend([
            "-F", str(ctx.attr.depth),
        ])
    solver_cmd.extend(ctx.attr.solver_arguments)

    abc_cmds.append(" ".join(solver_cmd))
    abc_cmds.append("write_cex -a $TEST_UNDECLARED_OUTPUTS_DIR/{}.aiw".format(ctx.label.name))

    smtbmc_args = [
        "-s", ctx.attr.witness_solver,
    ]
    smtbmc_args.extend(["-S {}".format(a) for a in ctx.attr.witness_solver_arguments])
    smtbmc_args.extend([
        "--noprogress",
        "--append", str(ctx.attr.append),
    ])
    if ctx.attr.tbtop:
        smtbmc_args.extend(["--vlogtb-top", ctx.attr.tbtop])
    smtbmc_args.extend(_trace_args(ctx.label.name))
    smtbmc_args.extend([
        "--aig {}:$TEST_UNDECLARED_OUTPUTS_DIR/{}.aiw".format(aig_map.short_path, ctx.label.name),
        "--aig-noheader", witness_model.short_path,
    ])

    ctx.actions.expand_template(
        output = ctx.outputs.executable,
        template = ctx.file._runner_template,
        substitutions = {
            "{smtbmc_solver_exe}": tool.executable(witness_solver).short_path,
            "{abc_exe}": tool.executable(toolchain.abc).short_path,
            "{abc_cmds}": "; ".join(abc_cmds),
            "{smtbmc_exe}": tool.executable(toolchain.smtbmc).short_path,
            "{smtbmc_args}": " ".join(smtbmc_args),
        },
    )

    return [DefaultInfo(
        data_runfiles = ctx.runfiles(
            tool.data_runfiles(toolchain.abc, toolchain.smtbmc, witness_solver)),
        default_runfiles = ctx.runfiles(
            tool.default_runfiles(toolchain.abc, toolchain.smtbmc, witness_solver) +
                [ctx.outputs.executable, aig_model, aig_map, witness_model]
        ),
    )]

abc_test = rule(
    implementation = _impl,
    attrs = {
        "mode": attr.string(
            default = _DEFAULT_MODE,
            values = ["bmc", "prove"],
            doc = "Type of formal task (bmc, prove) to run.",
        ),
        "srcs": attr.label_list(
            allow_files = [".vh", ".v", ".sv"],
            doc = "Verilog source files.",
        ),
        "deps": attr.label_list(
            providers = [verilog.files_info],
            doc = "Verlog library dependencies.",
        ),
        "yosys_preamble": attr.string_list(
            doc = "List of Yosys commands prepended to the script used to compile the SMT2 model.",
        ),
        "yosys_arguments": attr.string_list(
            doc = "Additional arguments to the Yosys compiler.",
        ),
        "multiclock": attr.bool(
            default = _DEFAULT_MULTICLOCK,
            doc = "Create a model with multiple clocks and/or asynchronous logic.",
        ),
        "stbv": attr.bool(
            default = _DEFAULT_STBV,
            doc = "Use large bit vectors (instead of uninterpreted functions) to represent the circuit state.",
        ),
        "stdt": attr.bool(
            default = _DEFAULT_STDT,
            doc = "Use SMT-LIB 2.6 datatypes to represent states.",
        ),
        "solver": attr.string(
            values = ["bmc3", "sim3", "pdr"],
            mandatory = True),
        "solver_arguments": attr.string_list(
            doc = "Additional arguments to the ABC solver.",
        ),
        "witness_solver": attr.string(
            default = _DEFAULT_WITNESS_SOLVER,
            values = ["yices", "z3", "boolector"],
            doc = "SMT solver used to generate counter traces.",
        ),
        "witness_solver_arguments": attr.string_list(
            doc = "Additional arguments for the witness solver.",
        ),
        "depth": attr.int(
            default = _DEFAULT_DEPTH,
            doc = "Depth of the bounded model check (only the specified number of cycles are considered) or depth for the k-induction performed.",
        ),
        "append": attr.int(
            default = _DEFAULT_APPEND,
            doc = "When generating a counter-example trace, add the specified number of cycles at the end of the trace.",
        ),
        "tbtop": attr.string(
            doc = "The top module for generated Verilog test benches, as hierarchical path relative to the design top module.",
        ),
        "_runner_template": attr.label(
            default = Label("//toolchain/yosys/resources:abc_runner.sh.in"),
            allow_single_file = True,
        ),
    },
    test = True,
    toolchains = ["//toolchain/yosys:toolchain_type"],
)
