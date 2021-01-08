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
Definitions to generate formal models of the various RISC-V extensions.
"""

load("//toolchain:rules.bzl", "verilog_library")

rv32_i = [
    "add",
    "addi",
    "and",
    "andi",
    "auipc",
    "beq",
    "bge",
    "bgeu",
    "blt",
    "bltu",
    "bne",
    "jal",
    "jalr",
    "lb",
    "lbu",
    "lh",
    "lhu",
    "lui",
    "lw",
    "or",
    "ori",
    "sb",
    "sh",
    "sll",
    "slli",
    "slt",
    "slti",
    "sltiu",
    "sltu",
    "sra",
    "srai",
    "srl",
    "srli",
    "sub",
    "sw",
    "xor",
    "xori",
]

rv32_c = [
    "c_add",
    "c_addi",
    "c_addi16sp",
    "c_addi4spn",
    "c_and",
    "c_andi",
    "c_beqz",
    "c_bnez",
    "c_j",
    "c_jal",
    "c_jalr",
    "c_jr",
    "c_li",
    "c_lui",
    "c_lw",
    "c_lwsp",
    "c_mv",
    "c_or",
    "c_slli",
    "c_srai",
    "c_srli",
    "c_sub",
    "c_sw",
    "c_swsp",
    "c_xor",
]

rv32_m = [
    "div",
    "divu",
    "mul",
    "mulh",
    "mulhsu",
    "mulhu",
    "rem",
    "remu",
]

_isa_extensions = {
    "rv32i": (rv32_i,),
    "rv32ic": (rv32_i, rv32_c),
    "rv32im": (rv32_i, rv32_m),
    "rv32imc": (rv32_i, rv32_m, rv32_c),
}

def riscv_isa(name = None, **attrs):
    srcs = [
        "isa_{}.v".format(name),
    ]
    for extension in _isa_extensions[name]:
        srcs.extend(["{}.v".format(i) for i in extension])

    verilog_library(
        name = name,
        srcs = srcs,
        **attrs,
    )

def rvfi_instruction_checks(isa = None, f = None, **attrs):
    for extension in _isa_extensions[isa]:
        for instruction in extension:
            f(
                instruction = instruction,
                isa = isa,
                tags = [
                    "instruction",
                    isa,
                ])

    native.test_suite(
        name = isa,
        tags = [
            "instruction",
            isa,
        ],
    )
