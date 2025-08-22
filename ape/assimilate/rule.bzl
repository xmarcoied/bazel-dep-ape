visibility("//ape/assimilate/...")

DOC = """Assimilates an αcτµαlly pδrταblε εxεcµταblε (APE) into a native binary."""

ATTRS = {
    "src": attr.label(
        doc = "The APE binary target to assimilate",
        allow_single_file = True,
        executable = True,
        cfg = "exec",
    ),
    "basename": attr.string(
        doc = "The basename for the symlink, which defaults to `name`",
    ),
    "_assimilate": attr.label(
        doc = "The APE assimilate binary.",
        allow_single_file = True,
        executable = True,
        cfg = "exec",
        default = "@cosmos-assimilate//:assimilate",
    ),
    "_macos": attr.label(
        providers = [platform_common.ConstraintValueInfo],
        default = "@platforms//os:macos",
    ),
    "_windows": attr.label(
        providers = [platform_common.ConstraintValueInfo],
        default = "@platforms//os:windows",
    ),
    "_arm64": attr.label(
        providers = [platform_common.ConstraintValueInfo],
        default = "@platforms//cpu:aarch64",
    ),
    "_amd64": attr.label(
        providers = [platform_common.ConstraintValueInfo],
        default = "@platforms//cpu:x86_64",
    ),
    # TODO: add `ppc64`: https://github.com/bazelbuild/platforms/issues/96
}

def implementation(ctx):
    windows = ctx.attr._windows[platform_common.ConstraintValueInfo]
    macos = ctx.attr._macos[platform_common.ConstraintValueInfo]
    arm64 = ctx.attr._arm64[platform_common.ConstraintValueInfo]

    basename = ctx.attr.basename or ctx.label.name
    if ctx.target_platform_has_constraint(windows) and not basename.endswith(".exe"):
        basename += ".exe"

    executable = ctx.actions.declare_file("{}.ape/{}".format(ctx.label.name, basename))

    if ctx.target_platform_has_constraint(windows):
        runfiles = _symlink(ctx, executable)
    elif ctx.target_platform_has_constraint(macos) and ctx.target_platform_has_constraint(arm64):
        runfiles = _symlink(ctx, executable)
    else:
        runfiles = _assimilate(ctx, executable)

    files = depset([executable])

    return DefaultInfo(
        executable = executable,
        files = files,
        runfiles = runfiles,
    )

def _assimilate(ctx, executable):
    ape = ctx.toolchains["//ape/toolchain/ape:type"]

    windows = ctx.attr._windows[platform_common.ConstraintValueInfo]
    macos = ctx.attr._macos[platform_common.ConstraintValueInfo]
    arm64 = ctx.attr._arm64[platform_common.ConstraintValueInfo]
    amd64 = ctx.attr._amd64[platform_common.ConstraintValueInfo]

    args = ctx.actions.args()
    args.add(ctx.file._assimilate)

    # Executable format
    if ctx.target_platform_has_constraint(windows):
        fail("Cannot assimilate on Windows, APE are already PE format. Symlink instead.")
    elif ctx.target_platform_has_constraint(macos) and ctx.target_platform_has_constraint(arm64):
        fail("Cannot assimilate on Apple Silicon, assimilate binaries are not runnable without APE loader. Symlink instead.")
    elif ctx.target_platform_has_constraint(macos):
        args.add("-m")  # MachO
    else:
        args.add("-e")  # ELF

    # Executable CPU
    # TODO: add `ppc64` (`-p`)
    if ctx.target_platform_has_constraint(amd64):
        args.add("-x")  # amd64
    elif ctx.target_platform_has_constraint(arm64):
        args.add("-a")  # arm64
    else:
        fail("Unknown assimilation CPU.")

    args.add("-o", executable.path)
    args.add(ctx.file.src)

    ctx.actions.run(
        outputs = [executable],
        inputs = [ctx.file._assimilate, ctx.file.src],
        executable = ape.run,
        arguments = [args],
        mnemonic = "ApeAssimilate",
        progress_message = "assimilating %{input}",
        toolchain = "//ape/toolchain/ape:type",
    )

    return ctx.runfiles([executable])

def _symlink(ctx, executable):
    ctx.actions.symlink(
        output = executable,
        target_file = ctx.file.src,
        is_executable = True,
    )

    runfiles = ctx.runfiles([executable, ctx.file.src])
    runfiles.merge(ctx.attr.src.default_runfiles)

    return runfiles

ape_assimilate = rule(
    doc = DOC,
    attrs = ATTRS,
    implementation = implementation,
    toolchains = ["//ape/toolchain/ape:type"],
    executable = True,
)

assimilate = ape_assimilate
