"""
Rules for Yosys.
"""

load("//toolchain/yosys:defs/smtbmc.bzl", "smtbmc_test")
load("//toolchain/yosys:defs/aiger.bzl", "aiger_test")
load("//toolchain/yosys:defs/abc.bzl", "abc_test")


def abc_bmc(**attrs):
    abc_test(mode = "bmc", **attrs)

def abc_prove(**attrs):
    abc_test(mode = "prove", **attrs)

def aiger_prove(**attrs):
    aiger_test(mode = "prove", **attrs)

def aiger_live(**attrs):
    aiger_test(mode = "live", **attrs)

def smtbmc_bmc(**attrs):
    smtbmc_test(mode = "bmc", **attrs)

def smtbmc_prove(**attrs):
    smtbmc_test(mode = "prove", **attrs)

def smtbmc_cover(**attrs):
    smtbmc_test(mode = "cover", **attrs)
