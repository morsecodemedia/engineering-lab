#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Task Definition
################################################################################

runtime_task_definition() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_task_definition <task-id>" >&2

        return 1

    fi

    local task="$1"

    local task_path

    task_path="$(
        printf "%s" "${task}" \
        | tr '.' '/'
    )"

    local definition="${ROOT}/knowledge/${task_path}/definition.json"

    if [[ ! -f "${definition}" ]]; then

        printf "%s\n" \
            "Task definition not found: ${task}" >&2

        return 1

    fi

    cat "${definition}"

}