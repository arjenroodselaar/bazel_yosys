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
