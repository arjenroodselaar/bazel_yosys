# PicoRV32 RISC-V CPU

This directory holds a copy of the [PicoRV32](https://github.com/cliffordwolf/picorv32.git) RISC-V softcore CPU. It currently serves as a demo and reference to implement the [RISC-V Formal Verification Framework](https://github.com/SymbioticEDA/riscv-formal) and to a lesser extend our Bazel rules for the Yosys toolchain.

## Getting Started

To see which parts of the core are currently verified you can test the following targets:

```
bazel test //hdl/cpu/picorv32/formal:rv32imc
```

## Upstream Updates

We made some small modifications to the original source when importing the core, most notably the renaming of the 'insn' instruction register to 'instruction'. We anticipate additional changes as we start working (and possibly improving) on this core. Because of this merging upstream changes will require some manual work. For this reason we should keep track of the upstream commit hashes to make it easier to determine what changes upstream and how to port these changes to our version.

### Merging Upstream

Using the last commit hash in the changlog below, generate the diff between that hash and either upstream master or the specific commit you are interested in. From that diff, determine the major changes and apply those by hand. Once applied, run the formal tests (see Getting Started) to make sure nothing breaks. If the formal tests are not passing after the manual merge you may have to update the riscv-formal tool as well, but do so with caughtion as you are now changing two (rather complicated) pieces simultaneously.

### Changelog

* Initial release, upstream 77277a0d322bee0f380e0cf6c13dd08123fbbfe7
