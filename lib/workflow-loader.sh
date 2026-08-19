#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Git Workflows
################################################################################

# shellcheck source=workflows/git/summary.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/git/summary.sh"

# shellcheck source=workflows/git/fetch.sh
# shellcheck disable=SC1091
source "${LIB_DIR}/workflows/git/fetch.sh"