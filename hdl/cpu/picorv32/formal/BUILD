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

load("//hdl/cpu/picorv32/formal:defs.bzl", "instruction_check")
load("//hdl/cpu/riscv_formal/isa:defs.bzl", "rvfi_instruction_checks")
load("//toolchain:rules.bzl", "verilog_library")

verilog_library(
    name = "rvfi",
    srcs = [
        "defines.sv",
        "wrapper.sv",
    ],
    deps = [
        "//hdl/cpu/riscv_formal/checks:macros",
    ],
)

rvfi_instruction_checks(
    isa = "rv32imc",
    f = instruction_check,
)
