# Yosys Verification Rules for Bazel

This repository contains some example verification rules/targets for Yosys, driven by Bazel.

## Getting Started

To get this running, make sure you have Docker installed. Run the following to create the required
image and start the container:

```
docker build --tag xyz/product-dev docker/
docker/run-devcontainer
```

Then trying running one of the formal tests for the PicoRV32 CPU:

```
cd product
bazel run //hdl/cpu/picorv32/formal:add
```

This will init and start Bazel, pull down any required dependencies and run a formal test for the
*add* instruction. Happy hacking!
