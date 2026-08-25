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
    local evidence

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

    evidence="$(
        jq -r '.pipeline.evidence // "engineering.context"' \
            <<< "${definition}"
    )"

    printf "\n"
    printf "Engineering Lab\n"
    printf "────────────────────────────────────────\n\n"

    printf "Task ID\n\n"
    printf "    %s\n\n" "${task}"

    printf "Name\n\n"
    printf "    %s\n\n" "${name}"

    printf "Description\n\n"
    printf "    %s\n\n" "${description}"

    printf "Domain\n\n"
    printf "    %s\n\n" "${domain^}"

    printf "Intent\n\n"
    printf "    %s\n\n" "${intent^}"

    printf "Evidence\n\n"
    printf "    %s\n\n" "${evidence}"

    printf "Validation\n\n"

    if runtime_knowledge_validate "${task}" >/dev/null 2>&1; then

        printf "    ✓ Knowledge Package\n"

    else

        printf "    ✗ Knowledge Package\n"

    fi

    printf "    ✓ Runtime\n"
    printf "    ✓ Evidence\n"
    printf "    ✓ Ready\n\n"

    printf "Execute\n\n"
    printf "    engineer task execute %s\n\n" "${task}"

}