#!/usr/bin/env bash

################################################################################
# Renderer
#
# Prompt
################################################################################

render_prompt() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: render_prompt <task-id>" >&2

        return 1

    fi

    local task="$1"

    local task_path

    task_path="$(
        printf "%s" "${task}" \
        | tr '.' '/'
    )"

    local prompt

    prompt="${ROOT}/knowledge/${task_path}/prompt.md"

    if [[ ! -f "${prompt}" ]]; then

        printf "%s\n" \
            "Prompt not found: ${task}" >&2

        return 1

    fi

    ############################################################################
    # Context
    ############################################################################

    local context

    context="$(
        cat
    )"

    ############################################################################
    # Prompt Composition
    ############################################################################

    cat "${prompt}"

    printf "\n\n"

    printf "%s\n" "${context}"

}