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
Definitions to declare various formal tasks for the picorv32 core.
"""

load("//toolchain/yosys:rules.bzl", "smtbmc_bmc")

def instruction_check(
        instruction = None,
        isa = None,
        tags = []):
    smtbmc_bmc(
        name = instruction,
        depth = 21,
        skip = 20,
        solver = "boolector",
        tbtop = "wrapper.uut",
        yosys_preamble = [
            "read_verilog -sv hdl/cpu/picorv32/formal/defines.sv",
            "read_verilog -sv hdl/cpu/riscv_formal/checks/rvfi_channel.sv",
            "read_verilog -sv hdl/cpu/riscv_formal/checks/rvfi_testbench.sv",
            "read_verilog -sv hdl/cpu/riscv_formal/checks/rvfi_instruction_check.sv",
            "read_verilog -sv hdl/cpu/riscv_formal/isa/%s.v" % instruction,
            "read_verilog -sv hdl/cpu/picorv32/formal/wrapper.sv",
            "read_verilog -sv hdl/cpu/picorv32/picorv32.v",
            "prep -flatten -nordff -top rvfi_testbench",
            "chformal -early",
        ],
        yosys_arguments = [
            "-DRISCV_FORMAL_CHECKER=rvfi_instruction_check",
            "-DRISCV_FORMAL_INSTRUCTION_MODEL=rvfi_instruction_%s" % instruction,
        ],
        deps = [
            "//hdl/cpu/picorv32",
            "//hdl/cpu/picorv32/formal:rvfi",
            "//hdl/cpu/riscv_formal/checks:channel",
            "//hdl/cpu/riscv_formal/checks:instruction_check",
            "//hdl/cpu/riscv_formal/checks:macros",
            "//hdl/cpu/riscv_formal/checks:testbench",
            "//hdl/cpu/riscv_formal/isa:%s" % isa,
        ],
        size = "medium",
        tags = tags,
    )
