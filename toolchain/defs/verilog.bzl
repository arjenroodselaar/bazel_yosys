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
A rule for Verilog libraries.
"""

VerilogFilesInfo = provider("transitive_sources")

def get_transitive_srcs(srcs, deps):
    return depset(
        srcs,
        transitive = [dep[VerilogFilesInfo].transitive_sources for dep in deps],
    )

def _verilog_library_impl(ctx):
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    return [
        VerilogFilesInfo(transitive_sources = trans_srcs),
        DefaultInfo(files = trans_srcs),
    ]

verilog_library = rule(
    implementation = _verilog_library_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".v", ".sv", ".vh"]),
        "deps": attr.label_list(providers = [VerilogFilesInfo]),
    },
)

verilog = struct(
    files_info = VerilogFilesInfo,
)
