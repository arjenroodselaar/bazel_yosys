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
