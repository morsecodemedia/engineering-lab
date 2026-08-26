#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Interactive AI Session
################################################################################

runtime_ai_session() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_ai_session <session-state>" >&2

        return 1

    fi

    local session="$1"

    local context

    context="$(
        runtime_session_context "${session}"
    )"

    local state

    state="$(
        runtime_ai_state
    )"

    local ready

    ready="$(
        jq -r '.ready' <<< "${state}"
    )"

    if [[ "${ready}" != "true" ]]; then

        printf "%s\n" \
            "AI model is not ready." >&2

        return 1

    fi

    local executable
    local artifact
    local context_size
    local gpu_layers

    executable="$(
        jq -r '.provider.executable' <<< "${state}"
    )"

    artifact="$(
        jq -r '.model.artifact' <<< "${state}"
    )"

    context_size="$(
        jq -r '.model.context' <<< "${state}"
    )"

    gpu_layers="$(
        jq -r '.model.gpu_layers' <<< "${state}"
    )"

    local system_prompt

    system_prompt="$(mktemp)"

    trap 'rm -f "${system_prompt}"' EXIT

    printf "%s\n" "${context}" > "${system_prompt}"

    exec \
        "${executable}" \
        --model "${artifact}" \
        --ctx-size "${context_size}" \
        --n-gpu-layers "${gpu_layers}" \
        --flash-attn on \
        --color on \
        -cnv \
        --system-prompt-file "${system_prompt}"

}