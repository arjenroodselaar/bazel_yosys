load("//toolchain:rules.bzl", "verilog_library")
load("//hdl/cpu/riscv_formal/checks:defs.bzl", "rvfi_library")
load("@rules_python//python:defs.bzl", "py_binary")

package(default_visibility = ["//visibility:public"])

py_binary(
    name = "gen_macros",
    srcs = [
        "gen_macros.py",
    ],
    python_version = "PY3",
)

verilog_library(
    name = "macros",
    srcs = [
        "rvfi_macros.vh",
    ],
)

rvfi_library(name = "channel")

rvfi_library(name = "instruction_check")

rvfi_library(name = "testbench")
