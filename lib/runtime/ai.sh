#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# AI
################################################################################

runtime_ai_state() {

    local installed=false
    local ready=false

    local provider=""
    local provider_name=""
    local executable=""

    local model=""
    local model_name=""
    local artifact=""

    local context=""
    local gpu_layers=""

    AI_ROOT="${HOME}/.config/engineering-lab/ai"

    # shellcheck disable=SC1090
    source "${AI_ROOT}/default.env"

    # shellcheck disable=SC1090
    source "${AI_ROOT}/providers/${AI_DEFAULT_PROVIDER}.env"

    # shellcheck disable=SC1090
    source "${AI_ROOT}/models/${AI_DEFAULT_MODEL}.env"

    provider="${AI_PROVIDER_ID}"
    provider_name="${AI_PROVIDER_NAME}"
    executable="${AI_PROVIDER_EXECUTABLE}"

    if [[ -x "${executable}" ]]; then
        installed=true
    fi

    model="${AI_MODEL_ID}"
    model_name="${AI_MODEL_NAME}"
    artifact="${AI_MODEL_ARTIFACT}"

    context="${AI_MODEL_CONTEXT}"
    gpu_layers="${AI_MODEL_GPU_LAYERS}"

    if [[ "${installed}" == true ]] \
        && [[ -f "${artifact}" ]]; then
        ready=true
    fi

    jq -n \
        --argjson installed "${installed}" \
        --argjson ready "${ready}" \
        --arg provider "${provider}" \
        --arg provider_name "${provider_name}" \
        --arg executable "${executable}" \
        --arg model "${model}" \
        --arg model_name "${model_name}" \
        --arg artifact "${artifact}" \
        --arg context "${context}" \
        --arg gpu_layers "${gpu_layers}" '
{
    schema: "ai-state/v1",

    installed: $installed,

    ready: $ready,

    provider: {
        id: $provider,
        name: $provider_name,
        executable: $executable
    },

    model: {
        id: $model,
        name: $model_name,
        artifact: $artifact,
        context: $context,
        gpu_layers: $gpu_layers
    },

    warnings: []
}
'
}