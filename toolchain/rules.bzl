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
Generic rules which do not fit anywhere else.
"""

load(
    "//toolchain:defs/tool.bzl",
    _tool = "tool",
    _tool_binary = "tool_binary",
)
load(
    "//toolchain:defs/verilog.bzl",
    _verilog = "verilog",
    _verilog_library = "verilog_library",
)

tool = _tool
tool_binary = _tool_binary

verilog = _verilog
verilog_library = _verilog_library
