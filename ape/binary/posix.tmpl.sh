#! /usr/bin/env sh

# Strict shell
set -o nounset
set -o errexit

# Runfiles
rlocation() (
  readonly FILEPATH="${1}"

  if test -x "${FILEPATH}"; then
    printf '%s' "${FILEPATH}"
    return
  fi

  if test -x "${0}.runfiles/${FILEPATH#../}"; then
    printf '%s' "${0}.runfiles/${FILEPATH#../}"
    return
  fi

  printf >&2 'Failed to find runfile: %s\n' "${FILEPATH}"
  exit 1
)

# Bazel substitutions
TARGET="$(rlocation "{{src}}")"
APE="$(rlocation "{{ape}}")"
readonly TARGET APE

# Execute!
"${APE}" "${TARGET}" "${@}"
