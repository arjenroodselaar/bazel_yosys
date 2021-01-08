# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""
Rules used to both generate a Yosys script and run those scripts against a design to generate
formal models.
"""

load("//toolchain:rules.bzl", "tool")


_DEFAULT_MULTICLOCK = False
_DEFAULT_NOMEM = False
_DEFAULT_SYN = False
_DEFAULT_STBV = False
_DEFAULT_STDT = False


def ys_write_script(
        ctx = None,
        name = None,
        commands = []):
    script = ctx.actions.declare_file(name)
    ctx.actions.write(
        output = script,
        content = "\n".join(commands) + "\n",
    )
    return script

_ys_model_types_file_extensions = {
    "aiger": ".aig",
    "blif": ".blif",
    "btor": ".btor",
    "edif": ".edif",
    "firrtl": ".firrtl",
    "ilang": ".il",
    "intersynth": ".is",
    "json": ".json",
    "simplec": ".c",
    "smt2": ".smt2",
    "smv": ".smv",
    "spice": ".spice",
    "table": ".txt",
    "verilog": ".v",
}

def ys_write_model(
        ctx = None,
        toolchain = None,
        name = None,
        type = None,
        srcs = [],
        data = [],
        commands = [],
        arguments = []):
    """Write a formal model using the Yosys compiler.

    Args:
        ctx: Rule context, allowing the actions of this function to be embedded in another rule.
        toolchain:
        name: Name of the model.
        type: Type of the model (smt2, aiger, etc.).
        srcs: Source used to construct the model, usually not Verilog (see data).
        data: Source files referenced in the commands.
        commands: A list of Yosys commands used to compile the model.
        arguments: Additional arguments to the Yosys compiler.

    Returns:
        DefaultInfo holding the outputs and runfiles.
    """

    # Validate command sequence.
    commands = list(commands)
    n = len(commands) - 1
    for i, cmd in enumerate(commands):
        if i != n and cmd.startswith("write_"):
            fail("'write_' commands are only allowed at the end of the sequence")
        elif i == n and not cmd.startswith("write_" + type):
            fail("last command is expected to be write_" + type)

    outputs = []
    file_ext = _ys_model_types_file_extensions[type]
    file = ctx.actions.declare_file(name + ("" if name.endswith(file_ext) else file_ext))
    outputs.append(file)

    # TODO (arjen): See if we can improve the assumption that there will not be a file name at
    # the end of the last command.

    # If this is an Aiger model, output the map.
    if type == "aiger" and commands[-1].endswith("-map"):
        map_ext = ".aim"
        map_file = ctx.actions.declare_file(file.basename.rstrip(file_ext) + map_ext)
        outputs.append(map_file)
        commands[-1] = commands[-1] + " " + map_file.path

    commands[-1] = commands[-1] + " " + file.path

    # Write a script file.
    script = ys_write_script(
        name = name + ".ys",
        ctx = ctx,
        commands = commands,
    )

    # Run the script on the design.
    args = ctx.actions.args()
    args.add_all(tool.default_arguments(toolchain.yosys))
    args.add("-b", type)
    args.add("-o", outputs[0])
    args.add("-s", script)
    args.add_all(arguments)
    args.add_all(srcs)

    ctx.actions.run(
        inputs = tool.runfiles(toolchain.yosys) + srcs + data + [script],
        executable = tool.executable(toolchain.yosys),
        arguments = [args],
        outputs = outputs,
    )
    return outputs

def _il(
        mode = None,
        preamble = [],
        multiclock = _DEFAULT_MULTICLOCK,
        nomem = _DEFAULT_NOMEM):
    """Generate Yosys commands to compile a model to an intermediate representation."""

    cmds = list(preamble)

    if nomem:
        cmds.append("memory_map")
    else:
        cmds.append("memory_nordff")

    if multiclock:
        cmds.append("clk2fflogic")
    else:
        cmds.extend([
            "async2sync",
            "chformal -assume -early",
        ])

    if mode in ["bmc", "prove"]:
        cmds.append("chformal -live -fair -cover -remove")
    elif mode == "cover":
        cmds.append("chformal -live -fair -remove")
    else:
        cmds.extend([
            "chformal -assert2assume",
            "chformal -cover -remove",
        ])

    cmds.extend([
        "opt_clean",
        "setundef -anyseq",
        "opt -keepdc -fast",
        "check",
        "hierarchy -simcheck",
    ])

    return cmds

def ys_write_smt2(
        ctx = None,
        toolchain = None,
        name = None,
        mode = None,
        srcs = [],
        deps = [],
        preamble = [],
        arguments = [],
        multiclock = _DEFAULT_MULTICLOCK,
        nomem = _DEFAULT_NOMEM,
        syn = _DEFAULT_SYN,
        stbv = _DEFAULT_STBV,
        stdt = _DEFAULT_STDT):
    """Compile a Verilog design into a SMT2 model.

    Args:
        ctx: Rule context, allowing the actions of this function to be embedded in another rule.
        toolchain: A Yosys toolchain.
        name: Name of the model.
        mode: The type of formal task this model will be used for (bmc, prove, cover).
        srcs: (Verilog) source files used to construct the model.
        deps: (Verilog) libraries used to construct the model.
        preamble: A list of Yosys commands prepended to the script used to compile the model.
        arguments: Additional arguments to the Yosys compiler.
        multiclock: Create a model with multiple clocks and/or asynchronous logic.
        nomem: Don’t use the SMT theory of arrays to model memories. Instead synthesize memories to
            registers and address logic.
        syn: Synthesize the circuit to a gate-level representation instead of using word-level SMT
            operators. This also runs some low-level logic optimization on the circuit.
        stbv: Use large bit vectors (instead of uninterpreted functions) to represent the circuit
            state.
        stdt: Use SMT-LIB 2.6 datatypes to represent states.

    Returns:
        A File containing the SMT2 model.
    """

    cmds = _il(
        mode = mode,
        preamble = preamble,
        multiclock = multiclock,
        nomem = nomem,
    )

    if syn:
        cmds.append("techmap")
        cmds.append("opt -fast")
        cmds.append("abc")
        cmds.append("opt_clean")

    cmds.append("stat")

    if stbv:
        cmds.append("write_smt2 -stbv -wires")
    elif stdt:
        cmds.append("write_smt2 -stdt -wires")
    else:
        cmds.append("write_smt2 -wires")

    return ys_write_model(
        ctx = ctx,
        toolchain = toolchain,
        name = name,
        type = "smt2",
        data = srcs + deps,
        commands = cmds,
        arguments = arguments,
    )[0]

def ys_write_btor(
        ctx = None,
        toolchain = None,
        name = None,
        mode = None,
        srcs = [],
        deps = [],
        preamble = [],
        arguments = [],
        multiclock = _DEFAULT_MULTICLOCK,
        nomem = _DEFAULT_NOMEM,
        syn = _DEFAULT_SYN):
    """Compile a Verilog design into a BTOR model.

    Args:
        ctx: Rule context, allowing the actions of this function to be embedded in another rule.
        toolchain: A Yosys toolchain.
        name: Name of the model.
        mode: The type of formal task this model will be used for (bmc, prove, cover).
        srcs: (Verilog) source files used to construct the model.
        deps: (Verilog) libraries used to construct the model.
        preamble: A list of Yosys commands prepended to the script used to compile the model.
        arguments: Additional arguments to the Yosys compiler.
        multiclock: Create a model with multiple clocks and/or asynchronous logic.
        nomem: Don’t use the SMT theory of arrays to model memories. Instead synthesize memories to
            registers and address logic.
        syn: Synthesize the circuit to a gate-level representation instead of using word-level SMT
            operators. This also runs some low-level logic optimization on the circuit.

    Returns:
        A File containing the BTOR model.
    """
    cmds = _il(
        mode = mode,
        preamble = preamble,
        multiclock = multiclock,
        nomem = nomem,
    )

    cmds.extend([
        "flatten",
        "setattr -unset keep",
        "delete -output",
        "opt -full",
    ])

    if syn:
        cmds.extend([
            "techmap",
            "opt -fast",
            "abc",
            "opt_clean",
        ])

    cmds.extend([
        "stat",
        "write_btor",
    ])

    return ys_write_model(
        ctx = ctx,
        toolchain = toolchain,
        name = name,
        type = "btor",
        data = srcs + deps,
        commands = cmds,
        arguments = arguments,
    )[0]

def ys_write_aiger(
        ctx = None,
        toolchain = None,
        name = None,
        mode = None,
        srcs = [],
        deps = [],
        preamble = [],
        arguments = [],
        multiclock = _DEFAULT_MULTICLOCK,
        nomem = _DEFAULT_NOMEM):
    """Compile a Verilog design into an Aiger model.

    Args:
        ctx: Rule context, allowing the actions of this function to be embedded in another rule.
        toolchain: A Yosys toolchain.
        name: Name of the model.
        mode: The type of formal task this model will be used for (bmc, prove, cover).
        srcs: (Verilog) source files used to construct the model.
        deps: (Verilog) libraries used to construct the model.
        preamble: A list of Yosys commands prepended to the script used to compile the model.
        arguments: Additional arguments to the Yosys compiler.
        multiclock: Create a model with multiple clocks and/or asynchronous logic.
        nomem: Don’t use the SMT theory of arrays to model memories. Instead synthesize memories to
            registers and address logic.

    Returns:
        A list of File objects holding the model and map.
    """
    cmds = _il(
        mode = mode,
        preamble = preamble,
        multiclock = multiclock,
        nomem = nomem,
    )

    cmds.extend([
        "flatten",
        "setattr -unset keep",
        "delete -output",
        "opt -full",
        "techmap",
        "opt -fast",
        "abc -g AND -fast",
        "opt_clean",
        "setundef -anyseq",
        "opt_clean",
        "stat",
        "write_aiger -I -B -zinit -map",
    ])

    return ys_write_model(
        ctx = ctx,
        toolchain = toolchain,
        name = name,
        type = "aiger",
        data = srcs + deps,
        commands = cmds,
        arguments = arguments,
    )
