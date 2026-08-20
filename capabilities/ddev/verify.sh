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

################################################################################
# Verification
################################################################################

ddev_state="$(
    runtime_ddev_state
)"

installed="$(
    jq -r '.installed' <<< "${ddev_state}"
)"

engine_available="$(
    jq -r '.engine_available' <<< "${ddev_state}"
)"

provider="$(
    jq -r '.provider' <<< "${ddev_state}"
)"