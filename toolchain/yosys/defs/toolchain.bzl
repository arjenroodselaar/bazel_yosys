"""
Toolchain rules for Yosys.
"""

load("//toolchain:rules.bzl", "tool")

ToolchainInfo = provider(
    doc = "Information on how to invoke Yosys and friends.",
    fields = [
        "yosys",
        "smtbmc",
        "abc",
        "yices_smt2",
        "z3",
        "boolector",
    ],
)

def _toolchain_impl(ctx):
    toolchain = platform_common.ToolchainInfo(
        toolchaininfo = ToolchainInfo(
            yosys = ctx.attr.yosys,
            smtbmc = ctx.attr.smtbmc,
            abc = ctx.attr.abc,
            yices_smt2 = ctx.attr.yices_smt2,
            z3 = ctx.attr.z3,
            boolector = ctx.attr.boolector,
        ))
    return [toolchain]

yosys_toolchain = rule(
    implementation = _toolchain_impl,
    attrs = {
        "yosys": attr.label(providers = [tool.info]),
        # Engines
        "smtbmc": attr.label(providers = [tool.info]),
        "abc": attr.label(providers = [tool.info]),
        # Solvers
        "yices_smt2": attr.label(providers = [tool.info]),
        "z3": attr.label(providers = [tool.info]),
        "boolector": attr.label(providers = [tool.info]),
    },
)
