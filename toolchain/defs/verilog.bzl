"""
A rule for Verilog libraries.
"""

VerilogFilesInfo = provider("transitive_sources")

def get_transitive_srcs(srcs, deps):
    return depset(
        srcs,
        transitive = [dep[VerilogFilesInfo].transitive_sources for dep in deps],
    )

def _verilog_library_impl(ctx):
    trans_srcs = get_transitive_srcs(ctx.files.srcs, ctx.attr.deps)
    return [
        VerilogFilesInfo(transitive_sources = trans_srcs),
        DefaultInfo(files = trans_srcs),
    ]

verilog_library = rule(
    implementation = _verilog_library_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = [".v", ".sv", ".vh"]),
        "deps": attr.label_list(providers = [VerilogFilesInfo]),
    },
)

verilog = struct(
    files_info = VerilogFilesInfo,
)
