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

docker_state="$(
    runtime_docker_state
)"

installed="$(
    jq -r '.installed' <<< "${docker_state}"
)"

engine_available="$(
    jq -r '.engine_available' <<< "${docker_state}"
)"

provider="$(
    jq -r '.provider' <<< "${docker_state}"
)"