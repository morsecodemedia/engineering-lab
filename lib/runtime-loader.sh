#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

RUNTIME_DIR="${LIB_DIR}/runtime"

################################################################################
# Runtime
################################################################################

# shellcheck source=runtime/docker.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/docker.sh"