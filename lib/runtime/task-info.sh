#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Task Information
################################################################################

runtime_task_info() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_task_info <task-id>" >&2

        return 1

    fi

    local task="$1"

    local definition

    definition="$(
        runtime_task_definition "${task}"
    )"

    local name
    local description
    local domain
    local intent

    name="$(
        jq -r '.name' <<< "${definition}"
    )"

    description="$(
        jq -r '.description' <<< "${definition}"
    )"

    domain="$(
        jq -r '.domain' <<< "${definition}"
    )"

    intent="$(
        jq -r '.intent' <<< "${definition}"
    )"

    printf "\n"
    printf "Engineering Lab\n"
    printf "Task Information\n"
    printf "────────────────────────────────────────\n\n"

    printf "Task\n\n"
    printf "    %s\n\n" "${task}"

    printf "Name\n\n"
    printf "    %s\n\n" "${name}"

    printf "Description\n\n"
    printf "    %s\n\n" "${description}"

    printf "Domain\n\n"
    printf "    %s\n\n" "${domain}"

    printf "Intent\n\n"
    printf "    %s\n\n" "${intent}"

    printf "Knowledge Package\n\n"
    printf "    %s\n\n" "${task}"

    printf "Status\n\n"

    if runtime_knowledge_validate "${task}" >/dev/null 2>&1; then

        printf "    ✓ Valid\n\n"

    else

        printf "    ✗ Invalid\n\n"

    fi

    printf "Example\n\n"
    printf "    engineer task execute %s\n\n" "${task}"

}