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
# System Workflows
################################################################################

# shellcheck source=workflows/system/process.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/system/process.sh"

################################################################################
# Shared Libraries
################################################################################

# shellcheck source=error.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/error.sh"

################################################################################
# Git Workflows
################################################################################

# shellcheck source=workflows/git/fetch.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/git/fetch.sh"

# shellcheck source=workflows/git/summary.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/git/summary.sh"

# shellcheck source=workflows/git/history.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/git/history.sh"