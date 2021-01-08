"""
Some generic rules to deal with prebuilt executables living in the repo.
"""

ToolInfo = provider(
    doc = "Information about how to invoke a tool",
    fields = [
        "executable",
        "default_arguments",
    ],
)

_wrapper = """#!/bin/sh
exec {exe} "$@"
"""

def _impl(ctx):
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = _wrapper.format(exe = ctx.file.executable.path),
        is_executable = True,
    )
    return [
        DefaultInfo(
            executable = ctx.outputs.executable,
            data_runfiles = ctx.runfiles(ctx.files.data_runfiles),
            default_runfiles = ctx.runfiles(
                ctx.files.default_runfiles + [ctx.outputs.executable, ctx.file.executable]),
        ),
        ToolInfo(
            executable = ctx.outputs.executable,
            default_arguments = ctx.attr.default_arguments,
        ),
    ]

tool_binary = rule(
    implementation = _impl,
    executable = True,
    attrs = {
        "executable": attr.label(
            allow_single_file = True,
            mandatory = True,
            executable = True,
            cfg = "host",
        ),
        "data_runfiles": attr.label_list(allow_files = True),
        "default_runfiles": attr.label_list(allow_files = True),
        "default_arguments": attr.string_list(),
    },
)

def _executable(tool):
    return tool[ToolInfo].executable

def _default_arguments(tool):
    return tool[ToolInfo].default_arguments

def _short_path(tool):
    return tool[ToolInfo].short_path

def _data_runfiles(*tools):
    runfiles = []
    for tool in tools:
        runfiles.extend(tool[DefaultInfo].data_runfiles.files.to_list())
    return runfiles

def _default_runfiles(*tools):
    runfiles = []
    for tool in tools:
        runfiles.extend(tool[DefaultInfo].default_runfiles.files.to_list())
    return runfiles

def _runfiles(*tools):
    return _data_runfiles(*tools) + _default_runfiles(*tools)

tool = struct(
    info = ToolInfo,
    executable = _executable,
    default_arguments = _default_arguments,
    short_path = _short_path,
    data_runfiles = _data_runfiles,
    default_runfiles = _default_runfiles,
    runfiles = _runfiles,
)
