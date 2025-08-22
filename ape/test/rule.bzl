visibility("//ape/test/...")

DOC = """Executes a binary target, with optional arguments, and validates the exit code.

Used as a simple test rule to validate the ape binaries run on the host system.
"""

ATTRS = {
    "target": attr.label(
        doc = "The ape binary target to test",
        allow_single_file = True,
        executable = True,
        cfg = "exec",
    ),
    "arguments": attr.string_list(
        doc = "Arguments to give to the binary.",
    ),
    "code": attr.int(
        doc = "The expected status code from the binary.",
        default = 0,
    ),
    "template": attr.label(
        doc = "The executable template script.",
        allow_single_file = True,
        default = ":template",
    ),
}

def stringify(value):
    return str(value)

def implementation(ctx):
    executable = ctx.actions.declare_file("{}.{}".format(ctx.label.name, ctx.file.template.extension))

    substitutions = ctx.actions.template_dict()
    substitutions.add("{{target}}", ctx.file.target.short_path)
    substitutions.add("{{code}}", str(ctx.attr.code))
    substitutions.add_joined("{{arguments}}", depset(ctx.attr.arguments), join_with = "\n", map_each = stringify)

    ctx.actions.expand_template(
        template = ctx.file.template,
        output = executable,
        computed_substitutions = substitutions,
        is_executable = True,
    )

    files = depset([executable])

    runfiles = ctx.runfiles([executable])
    runfiles = runfiles.merge(ctx.attr.target.default_runfiles)

    return DefaultInfo(
        executable = executable,
        files = files,
        runfiles = runfiles,
    )

ape_test = rule(
    doc = DOC,
    attrs = ATTRS,
    implementation = implementation,
    test = True,
)

test = ape_test
