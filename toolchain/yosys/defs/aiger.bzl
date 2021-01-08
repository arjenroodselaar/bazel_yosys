"""
A rule to wrap formal Aiger engine tasks as Bazel tests.
"""

def _impl(ctx):
    # TODO (T5): Determine why Avy segfaults and/or get suprove to work
    fail("Aiger not currently supported")

aiger_test = rule(
    implementation = _impl,
    attrs = {
        "solver": attr.string(
            values = ["suprove", "avy", "aigbmc"],
            mandatory = True),
        "solver_arguments": attr.string_list(),
        "_runner_template": attr.label(
            default = Label("//toolchain/yosys/resources:smtbmc_runner.sh.in"),
            allow_single_file = True,
        ),
    },
    test = True,
    toolchains = ["//toolchain/yosys:toolchain_type"],
)
