# RISC-V Formal Verification Framework

This directory holds a copy of the [RISC-V Formal Verification Framework](https://github.com/SymbioticEDA/riscv-formal) and is used to verify the PicoRV32 softcore under hdl/cpu/picorv32. For more information please see the upstream [README](https://github.com/SymbioticEDA/riscv-formal/blob/master/README.md).

## Upstream Updates

We made some modifications to the original source when importing the framework, most notably the renaming of the 'insn' instruction register to 'instruction'. We anticipate additional changes as we start working (and possibly improving) on this framework and the processor cores. Because of this merging upstream changes will require some manual work. For this reason we should keep track of the upstream commit hashes to make it easier to determine what changes upstream and how to port these changes to our version.

### Merging Upstream

Using the last commit hash in the changlog below, generate the diff between that hash and either upstream master or the specific commit you are interested in. From that diff, determine the major changes and apply those by hand. Once applied, run the formal tests for the PicoRV32 core and see what breaks. You probably want to follow these steps:

* Diff the changes in *upstream/insns/generate.py* and apply them to *hdl/cpu/riscv_formal/isa/gen.py*.
* Regenerate the instruction source files by running the following:
  ```
  bazel run //hdl/cpu/riscv_formal/isa:gen -- $PWD/hdl/cpu/riscv_formal/isa
  ```
* Diff the changes in *upstream/checks/rvfi_macros.py* and apply them to *hdl/cpu/riscv_formal/checks/gen_macros.py*.
* Regenerate the macro header by running the following:
  ```
  bazel run //hdl/cpu/riscv_formal/checks:gen_macros > hdl/cpu/riscv_formal/checks/rvfi_macros.vh
  ```
* Diff the changes in *upstream/checks/\*.sv* and apply them to the ones found in *cpu/hdl/riscv_formal/checks*. Please not that *rvfi_insn_check.sv* has been renamed to *rvfi_instruction_check.sv*.

### Changelog

* Initial release, upstream 1d19c27e2648077b689e6c57e0f049d723e546b6
