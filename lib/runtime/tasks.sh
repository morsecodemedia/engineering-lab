#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Tasks
################################################################################

runtime_task_list() {

    local knowledge_root

    knowledge_root="${ROOT}/knowledge"

    printf "\n"
    printf "Engineering Lab\n"
    printf "Task Catalog\n"
    printf "────────────────────────────────────────\n\n"

    local domain
    local task

    local domain_count=0
    local task_count=0

    while IFS= read -r domain; do

        [[ -d "${domain}" ]] || continue

        local tasks=()

        local visible_tasks=()

        while IFS= read -r task; do

            [[ -d "${task}" ]] || continue

            [[ -f "${task}/definition.json" ]] || continue

            visible_tasks+=("${task}")

        done < <(
            find "${domain}" \
                -mindepth 1 \
                -maxdepth 1 \
                -type d \
                | sort
        )

        ((${#visible_tasks[@]})) || continue

        ((++domain_count))

        local domain_name
        domain_name="$(basename "${domain}")"

        printf "%s (%d)\n\n" \
            "${domain_name^}" \
            "${#visible_tasks[@]}"

        for task in "${visible_tasks[@]}"; do

            local id
            local description

            id="$(basename "${task}")"

            description="$(
                jq -r \
                    '.description // "(No description)"' \
                    "${task}/definition.json"
            )"

            printf "    %s\n" "${id}"
            printf "        %s\n\n" "${description}"

            ((++task_count))

        done
        printf "\n"

    done < <(
        find "${knowledge_root}" \
            -mindepth 1 \
            -maxdepth 1 \
            -type d \
            | sort
    )

    printf "────────────────────────────────────────\n\n"

    printf "Domains:    %d\n" "${domain_count}"
    printf "Tasks:      %d\n\n" "${task_count}"

    printf "Example:\n\n"
    printf "    engineer task execute repository.review\n\n"

}