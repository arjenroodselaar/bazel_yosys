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

load("//hdl/cpu/riscv_formal/isa:defs.bzl", "riscv_isa")
load("@rules_python//python:defs.bzl", "py_binary")

package(default_visibility = ["//visibility:public"])

py_binary(
    name = "gen",
    srcs = [
        "gen.py",
    ],
    python_version = "PY3",
)

riscv_isa(name = "rv32i")
riscv_isa(name = "rv32im")
riscv_isa(name = "rv32imc")
