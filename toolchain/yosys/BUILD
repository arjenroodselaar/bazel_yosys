load("//toolchain:rules.bzl", "tool_binary")
load("//toolchain/yosys:defs/toolchain.bzl", "yosys_toolchain")

package(default_visibility = ["//visibility:public"])

toolchain_type(name = "toolchain_type")

tool_binary(
    name = "yosys",
    executable = "0.9-2daa5685/bin/yosys",
    data_runfiles = glob([
        "0.9-2daa5685/share/yosys/**/*.v",
        "0.9-2daa5685/share/yosys/**/*.vh",
        "0.9-2daa5685/share/yosys/**/*.lib",
        "0.9-2daa5685/share/yosys/**/*.box",
        "0.9-2daa5685/share/yosys/**/*.lut",
        "0.9-2daa5685/share/yosys/**/*.txt",
    ]),
    default_arguments = [
        "-Q",  # suppress printing banner
        "-T",  # suppress printing footer
        "-q",  # warnings and errors only
    ],
)

tool_binary(
    name = "yosys-smtbmc",
    executable = "0.9-2daa5685/bin/yosys-smtbmc",
    default_runfiles = [
        "0.9-2daa5685/share/yosys/python3/smtio.py",
    ],
)

tool_binary(
    name = "yosys-abc",
    executable = "0.9-2daa5685/bin/yosys-abc",
)

yosys_toolchain(
    name = "0.9-2daa5685",
    yosys = "//toolchain/yosys:yosys",
    smtbmc = "//toolchain/yosys:yosys-smtbmc",
    abc = "//toolchain/yosys:yosys-abc",
    yices_smt2 = "//toolchain/solvers/yices:yices-smt2",
    z3 = "//toolchain/solvers/z3:z3",
    boolector = "//toolchain/solvers/boolector:boolector",
)

toolchain(
    name = "toolchain",
    toolchain = ":0.9-2daa5685",
    toolchain_type = ":toolchain_type",
)
