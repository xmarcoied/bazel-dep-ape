#! /usr/bin/env bash

# Strict shell
set -o nounset

# Bazel substitutions
TARGET="{{target}}"
ARGUMENTS="{{arguments}}"
CODE="{{code}}"
readonly TARGET ARGUMENTS CODE

# Process the arguments
declare -a ARGS
printf '%s\n' "${ARGUMENTS}" |
  while IFS= read -r LINE; do
    ARGS+=("${LINE}")
  done

# Execute!
"${TARGET}" "${ARGUMENTS[@]}"
STATUS=$?
readonly STATUS

# Check the exit code
if test "${CODE}" != "${STATUS}"; then
  printf >&2 'Error: incorrect exit code (%i): %s %s\n' "${STATUS}" "${TARGET}" "${ARGUMENTS[*]}"
  exit 126
fi
