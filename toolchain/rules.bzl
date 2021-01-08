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
