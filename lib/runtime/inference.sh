#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# AI Inference
################################################################################

runtime_ai_infer() {

    ############################################################################
    # Prompt
    ############################################################################

    local prompt

    prompt="$(
        cat
    )"

    if [[ -z "${prompt}" ]]; then

        printf "%s\n" \
            "No prompt provided." >&2

        return 1

    fi

    ############################################################################
    # Runtime
    ############################################################################

    local state

    state="$(
        runtime_ai_state
    )"

    local installed
    local ready

    installed="$(
        jq -r '.installed' <<< "${state}"
    )"

    ready="$(
        jq -r '.ready' <<< "${state}"
    )"

    if [[ "${installed}" != "true" ]]; then

        printf "%s\n" \
            "AI provider is not installed." >&2

        return 1

    fi

    if [[ "${ready}" != "true" ]]; then

        printf "%s\n" \
            "AI model is not ready." >&2

        return 1

    fi

    ############################################################################
    # Provider
    ############################################################################

    local executable
    local artifact
    local context
    local gpu_layers

    executable="$(
        jq -r '.provider.executable' <<< "${state}"
    )"

    artifact="$(
        jq -r '.model.artifact' <<< "${state}"
    )"

    context="$(
        jq -r '.model.context' <<< "${state}"
    )"

    gpu_layers="$(
        jq -r '.model.gpu_layers' <<< "${state}"
    )"

    ############################################################################
    # Inference
    ############################################################################

    "${executable}" \
        --model "${artifact}" \
        --prompt "${prompt}" \
        --ctx-size "${context}" \
        --n-gpu-layers "${gpu_layers}" \
        --single-turn \
        --simple-io \
        --no-display-prompt

}