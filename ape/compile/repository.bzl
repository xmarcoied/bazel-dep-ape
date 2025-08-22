visibility("//ape/...")

DOC = """Performs repository time compilation of source files."""

ATTRS = {
    "build": attr.label(
        doc = "The `BUILD.bazel` template.",
        allow_single_file = True,
        default = ":BUILD.tmpl.bazel",
    ),
    "srcs": attr.label_list(
        doc = "The source files to compile.",
        allow_files = [".c"],
        allow_empty = False,
    ),
    "output": attr.string(
        doc = "The compiled output file.",
        mandatory = True,
    ),
    "zig": attr.label(
        doc = "The `zig` compiler to use.",
        allow_single_file = True,
        executable = True,
        cfg = "exec",
        default = "@zig",
    ),
}

def implementation(rctx):
    cmd = [
        rctx.attr.zig,
        "cc",
        "-o",
        rctx.attr.output,
    ]
    cmd.extend(rctx.attr.srcs)

    result = rctx.execute(cmd)
    if result.return_code != 0:
        fail("Failed to compile: {}".format(result.stderr))

    rctx.template("BUILD.bazel", rctx.attr.build, {
        "{{output}}": repr(rctx.attr.output),
    })

compile = repository_rule(
    doc = DOC,
    attrs = ATTRS,
    implementation = implementation,
    configure = True,
)
