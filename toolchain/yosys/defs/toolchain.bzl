# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
