#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Workflows
################################################################################

# shellcheck source=../../workflow-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/workflow-loader.sh"

################################################################################
# Shell
################################################################################

# shellcheck source=../../shell-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/shell-loader.sh"