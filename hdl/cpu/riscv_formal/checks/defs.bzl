"""
Definitions to aid working with rvfi libraries.
"""

load("//toolchain:rules.bzl", "verilog_library")

def rvfi_library(name = None, **attrs):
    verilog_library(
        name = name,
        srcs = [
            "rvfi_{}.sv".format(name),
        ],
        **attrs,
    )
