visibility("//ape/binary/...")

DOC = """Launches an αcτµαlly pδrταblε εxεcµταblε (APE) binary with the correct launcher.

This avoids any issues with `binfmt_misc` picking up binaries under Wine or similar.
"""

ATTRS = {
    "src": attr.label(
        doc = "The ape binary target to launch",
        allow_single_file = True,
        executable = True,
        cfg = "exec",
    ),
    "_template": attr.label(
        doc = "The executable template script.",
        allow_single_file = True,
        default = ":template",
    ),
}

def implementation(ctx):
    ape = ctx.toolchains["//ape/toolchain/ape:type"]

    executable = ctx.actions.declare_file("{}.{}".format(ctx.label.name, ctx.file._template.extension))

    substitutions = ctx.actions.template_dict()
    substitutions.add("{{ape}}", ape.executable.short_path)
    substitutions.add("{{src}}", ctx.file.src.short_path)

    ctx.actions.expand_template(
        template = ctx.file._template,
        output = executable,
        computed_substitutions = substitutions,
        is_executable = True,
    )

    files = depset([executable])

    runfiles = ctx.runfiles([executable, ctx.executable.src, ape.executable])
    runfiles = runfiles.merge(ctx.attr.src.default_runfiles)
    runfiles = runfiles.merge(ape.default.default_runfiles)

    return DefaultInfo(
        executable = executable,
        files = files,
        runfiles = runfiles,
    )

ape_binary = rule(
    doc = DOC,
    attrs = ATTRS,
    implementation = implementation,
    toolchains = ["//ape/toolchain/ape:type"],
    executable = True,
)

binary = ape_binary
