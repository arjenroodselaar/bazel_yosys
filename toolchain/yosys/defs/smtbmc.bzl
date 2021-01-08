"""
A rule to wrap formal smtbmc tasks as Bazel tests.
"""

load("//toolchain:rules.bzl", "tool", "verilog")
load("//toolchain/yosys:defs/yosys.bzl", "ys_write_smt2")


_DEFAULT_MODE = "bmc"
_DEFAULT_SOLVER = "yices"
_DEFAULT_DEPTH = 20
_DEFAULT_SKIP = 0
_DEFAULT_APPEND = 0
_DEFAULT_MULTICLOCK = False
_DEFAULT_NOMEM = False
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
    cover = (ctx.attr.mode == "cover")

    yices = (ctx.attr.solver == "yices")
    z3 = (ctx.attr.solver == "z3")
    boolector = (ctx.attr.solver == "boolector")

    toolchain = ctx.toolchains["//toolchain/yosys:toolchain_type"].toolchaininfo

    model = ys_write_smt2(
        ctx = ctx,
        toolchain = toolchain,
        name = ctx.label.name + ".smt2",
        mode = ctx.attr.mode,
        srcs = ctx.files.srcs,
        deps = ctx.files.deps,
        preamble = ctx.attr.yosys_preamble,
        arguments = ctx.attr.yosys_arguments,
        multiclock = ctx.attr.multiclock,
        nomem = ctx.attr.nomem,
        syn = ctx.attr.syn,
        stbv = ctx.attr.stbv,
        stdt = ctx.attr.stdt,
    )

    args = []
    args.extend(["-s", ctx.attr.solver])
    args.extend(["-S {}".format(a) for a in ctx.attr.solver_arguments])

    # TODO (arjen): Determine if/how this can be used when test is run using "bazel run ...".
    args.append("--noprogress")

    if ctx.attr.presat:
        args.append("--presat")

    if ctx.attr.unroll == None:
        if not z3:
            args.append("--unroll")
    elif ctx.attr.unroll:
        args.append("--unroll")

    if ctx.attr.skip > 0:
        args.extend(["-t", "{}:{}".format(ctx.attr.skip, ctx.attr.depth)])
    else:
        args.extend(["-t", str(ctx.attr.depth)])
    args.extend(["--append", str(ctx.attr.append)])

    if ctx.attr.tbtop:
        args.extend(["--vlogtb-top", ctx.attr.tbtop])

    trace_args = _trace_args(ctx.label.name + ("_%" if cover else ""))
    base_trace_args = _trace_args(ctx.label.name + ".base") if prove else []
    induction_trace_args = _trace_args(ctx.label.name + ".induction") if prove else []

    solver = None
    if yices:
        solver = toolchain.yices_smt2
    elif z3:
        solver = toolchain.z3
    elif boolector:
        solver = toolchain.boolector

    ctx.actions.expand_template(
        output = ctx.outputs.executable,
        template = ctx.file._prove_template if prove else ctx.file._template,
        substitutions = {
            "{solver_exe}": tool.executable(solver).short_path,
            "{smtbmc_exe}": tool.executable(toolchain.smtbmc).short_path,
            "{mode}": "-c" if cover else ("-i" if prove else ""),
            "{args}": " ".join(args),
            "{trace_args}": " ".join(trace_args),
            "{base_trace_args}": " ".join(base_trace_args),
            "{induction_trace_args}": " ".join(induction_trace_args),
            "{model}": model.short_path,
        },
    )

    return [DefaultInfo(
        data_runfiles = ctx.runfiles(
            tool.data_runfiles(toolchain.yosys, toolchain.smtbmc, solver),
        ),
        default_runfiles = ctx.runfiles(
            tool.default_runfiles(toolchain.yosys, toolchain.smtbmc, solver) +
            [ctx.outputs.executable, model],
        ),
    )]

smtbmc_test = rule(
    implementation = _impl,
    attrs = {
        "mode": attr.string(
            default = _DEFAULT_MODE,
            values = ["bmc", "prove", "cover"],
            doc = "Type of formal task (bmc, prove, cover) to run.",
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
        "nomem": attr.bool(
            default = _DEFAULT_NOMEM,
            doc = "Synthesize memories to registers and address logic instead of using the SMT theory of arrays to model memories.",
        ),
        "syn": attr.bool(
            default = _DEFAULT_SYN,
            doc = "Synthesize the circuit to a gate-level representation instead of using word-level SMT operators.",
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
            default = _DEFAULT_SOLVER,
            values = ["yices", "z3", "boolector"],
            doc = "SMT solver used to execute the task.",
        ),
        "solver_arguments": attr.string_list(
            doc = "Additional arguments to the solver.",
        ),
        "depth": attr.int(
            default = _DEFAULT_DEPTH,
            doc = "Depth of the bounded model check (only the specified number of cycles are considered) or depth for the k-induction performed.",
        ),
        "skip": attr.int(
            default = _DEFAULT_SKIP,
            doc = "Skip the specified number of time steps (bmc, cover only).",
        ),
        "append": attr.int(
            default = _DEFAULT_APPEND,
            doc = "When generating a counter-example trace, add the specified number of cycles at the end of the trace.",
        ),
        "presat": attr.bool(
            default = _DEFAULT_PRESAT,
            doc = "Run 'presat' SMT queries that make sure assumptions are non-conflicting (and potentially warmup the SMT solver",
        ),
        "unroll": attr.bool(
            doc = "Enable/disable unrolling of the SMT problem.",
        ),
        "tbtop": attr.string(
            doc = "The top module for generated Verilog test benches, as hierarchical path relative to the design top module.",
        ),
        "_template": attr.label(
            default = Label("//toolchain/yosys/resources:smtbmc_runner.sh.in"),
            allow_single_file = True,
        ),
        "_prove_template": attr.label(
            default = Label("//toolchain/yosys/resources:smtbmc_prove_runner.sh.in"),
            allow_single_file = True,
        ),
    },
    test = True,
    toolchains = ["//toolchain/yosys:toolchain_type"],
)
