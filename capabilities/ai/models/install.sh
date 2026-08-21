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
    cd "${SCRIPT_DIR}/../../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# MCU
################################################################################

MCU_INSTALLATION="${HOME}/.config/mcu/installation.env"

[[ -r "${MCU_INSTALLATION}" ]] || {
    printf "%s\n" "MCU is not installed." >&2
    exit 1
}

# shellcheck disable=SC1090
source "${MCU_INSTALLATION}"

# shellcheck disable=SC1090
source "${PRODUCT_ROOT}/lib/sdk/loader.sh"

################################################################################
# AI Configuration
################################################################################

AI_ROOT="${HOME}/.config/engineering-lab/ai"

# shellcheck disable=SC1090
source "${AI_ROOT}/default.env"

# shellcheck disable=SC1090
source "${AI_ROOT}/models/${AI_DEFAULT_MODEL}.env"

mkdir -p "${AI_MODEL_STORE}"

################################################################################
# Installation
################################################################################

hf download \
    "${AI_MODEL_REPOSITORY}" \
    "${AI_MODEL_FILENAME}" \
    --local-dir "${AI_MODEL_STORE}"