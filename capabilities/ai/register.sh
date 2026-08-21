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
# Configuration
################################################################################

CONFIG_DIR="${HOME}/.config/engineering-lab/ai"

mkdir -p "${CONFIG_DIR}"
mkdir -p "${CONFIG_DIR}/providers"
mkdir -p "${CONFIG_DIR}/models"

################################################################################
# Defaults
################################################################################

mcu_template_render \
    "${ROOT}/config/ai/default.env.in" \
    "${CONFIG_DIR}/default.env" \
    AI_DEFAULT_PROVIDER="llama" \
    AI_DEFAULT_MODEL="qwen-coder" \
    AI_MODEL_STORE="${HOME}/.local/share/engineering-lab/artifacts/models"

################################################################################
# Provider
################################################################################

LLAMA_EXECUTABLE="$(
    command -v llama-cli
)"

mcu_template_render \
    "${ROOT}/config/ai/providers/llama.env.in" \
    "${CONFIG_DIR}/providers/llama.env" \
    AI_PROVIDER_EXECUTABLE="${LLAMA_EXECUTABLE}"

################################################################################
# Model Metadata
################################################################################

# shellcheck disable=SC1090
source "${ROOT}/config/ai/models/qwen-coder.env.in"

MODEL_ARTIFACT="${HOME}/.local/share/engineering-lab/artifacts/models/${AI_MODEL_FILENAME}"

cat > "${CONFIG_DIR}/models/qwen-coder.env" <<EOF
################################################################################
# Model
################################################################################

AI_MODEL_ID="${AI_MODEL_ID}"

AI_MODEL_NAME="${AI_MODEL_NAME}"

################################################################################
# Artifact
################################################################################

AI_MODEL_ARTIFACT="${MODEL_ARTIFACT}"

################################################################################
# Runtime
################################################################################

AI_MODEL_CONTEXT="16384"

AI_MODEL_GPU_LAYERS="999"

################################################################################
# Capabilities
################################################################################

AI_MODEL_CAPABILITIES="${AI_MODEL_CAPABILITIES}"
EOF