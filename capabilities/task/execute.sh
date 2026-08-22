#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Runtime
################################################################################

# shellcheck source=../../lib/runtime-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-loader.sh"

# shellcheck source=../../lib/renderers-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/renderers-loader.sh"

################################################################################
# Validation
################################################################################

if (($# != 1)); then

    printf "%s\n" \
        "Usage: engineer task <task-id>" >&2

    exit 1

fi

################################################################################
# Execute
################################################################################

runtime_task_execute "$1"