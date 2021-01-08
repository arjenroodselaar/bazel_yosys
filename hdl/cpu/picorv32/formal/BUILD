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
