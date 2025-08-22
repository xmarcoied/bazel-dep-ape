visibility("//...")

DOC = "Use to validate that symlinked APE binaries can be used"

ATTRS = {
    "_test": attr.label(
        executable = True,
        cfg = "exec",
        allow_single_file = True,
        default = "@ape//ape:true",
    ),
}

def implementation(ctx):
    output = ctx.actions.declare_file(ctx.label.name)

    ctx.actions.symlink(
        output = output,
        target_file = ctx.file._test,
        is_executable = True,
    )

    runfiles = ctx.runfiles((ctx.file._test, output))
    runfiles.merge(ctx.attr._test.default_runfiles)

    return DefaultInfo(
        executable = output,
        files = depset([output]),
        runfiles = runfiles,
    )

e2e_symlink_test = rule(
    doc = DOC,
    attrs = ATTRS,
    implementation = implementation,
    test = True,
)

test = e2e_symlink_test
