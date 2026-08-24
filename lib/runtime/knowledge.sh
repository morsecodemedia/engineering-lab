#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Knowledge
################################################################################

runtime_knowledge_validate() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_knowledge_validate <task-id>" >&2

        return 1

    fi

    local task="$1"

    local task_path

    task_path="$(
        printf "%s" "${task}" \
        | tr '.' '/'
    )"

    local package

    package="${ROOT}/knowledge/${task_path}"

    if [[ ! -d "${package}" ]]; then

        printf "%s\n" \
            "Knowledge package not found: ${task}" >&2

        return 1

    fi

    printf "\n"
    printf "Knowledge Package\n\n"
    printf "    %s\n\n" "${task}"

    printf "────────────────────────────────────────\n\n"

    local failed=0

    for file in \
        definition.json \
        instructions.md \
        background.md \
        assumptions.md \
        principles.md \
        calibration.md \
        expectations.md \
        README.md
    do

        if [[ -f "${package}/${file}" ]]; then

            printf "✓ %s\n" "${file}"

        else

            printf "✗ %s\n" "${file}"

            failed=1

        fi

    done

    printf "\n────────────────────────────────────────\n\n"

    if (( failed )); then

        printf "FAIL\n"

        return 1

    fi

    local definition

    definition="$(
        cat "${package}/definition.json"
    )"

    local runtime
    local context_renderer
    local prompt

    runtime="$(
        jq -r '.pipeline.runtime' <<< "${definition}"
    )"

    context_renderer="$(
        jq -r '.pipeline.context_renderer' <<< "${definition}"
    )"

    prompt="$(
        jq -r '.pipeline.prompt' <<< "${definition}"
    )"

    if runtime_resolve "${runtime}" >/dev/null 2>&1; then

        printf "✓ Runtime\n"

    else

        printf "✗ Runtime\n"

        failed=1

    fi

    if context_renderer_resolve "${context_renderer}"; then

        printf "✓ Context Renderer\n"

    else

        printf "✗ Context Renderer\n"

        failed=1

    fi

    if [[ -f "${ROOT}/knowledge/${prompt//./\/}/instructions.md" ]]; then

        printf "✓ Knowledge Artifact\n"

    else

        printf "✗ Knowledge Artifact\n"

        failed=1

    fi

    printf "\n────────────────────────────────────────\n\n"

    if (( failed )); then

        printf "FAIL\n"

        return 1

    fi

    printf "PASS\n"

}