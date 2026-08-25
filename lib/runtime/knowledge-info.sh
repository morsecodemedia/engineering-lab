#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Knowledge Information
################################################################################

runtime_knowledge_info() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_knowledge_info <task-id>" >&2

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

        printf "Knowledge package not found: %s\n" "${task}" >&2

        return 1

    fi

    local artifact_count

    artifact_count="$(
        find "${package}" \
            -maxdepth 1 \
            -type f \
            | wc -l \
            | tr -d ' '
    )"

    printf "\n"
    printf "Engineering Lab\n"
    printf "Knowledge Package\n"
    printf "────────────────────────────────────────\n\n"

    printf "Task ID\n\n"
    printf "    %s\n\n" "${task}"

    printf "Location\n\n"
    printf "    knowledge/\n"

    IFS='/' read -r domain task_name <<< "${task_path}"

    printf "    └── %s/\n" "${domain}"
    printf "        └── %s/\n\n" "${task_name}"

    printf "Artifacts\n\n"

    local file

    local artifacts=(
        "definition.json"
        "README.md"
        "instructions.md"
        "background.md"
        "assumptions.md"
        "principles.md"
        "calibration.md"
        "expectations.md"
    )

    local artifact

    for artifact in "${artifacts[@]}"; do

        if [[ -f "${package}/${artifact}" ]]; then

            printf "    ✓ %s\n" "${artifact}"

        else

            printf "    ✗ %s\n" "${artifact}"

        fi

    done

    printf "\n"

    printf "\n"

    printf "Validation\n\n"

    if runtime_knowledge_validate "${task}" >/dev/null 2>&1; then

        printf "    ✓ Knowledge Package Valid\n\n"

    else

        printf "    ✗ Knowledge Package Invalid\n\n"

    fi

    local markdown_count
    local json_count

    markdown_count="$(
        find "${package}" \
            -maxdepth 1 \
            -name "*.md" \
            | wc -l \
            | tr -d ' '
    )"

    json_count="$(
        find "${package}" \
            -maxdepth 1 \
            -name "*.json" \
            | wc -l \
            | tr -d ' '
    )"

    printf "Statistics\n\n"

    printf "    Artifacts:      %s\n" "${artifact_count}"
    printf "    │\n"
    printf "    ├── Markdown:   %s\n" "${markdown_count}"
    printf "    └── JSON:       %s\n\n" "${json_count}"

    # printf "Knowledge Metrics\n\n"
    # printf "    Coming Soon     %s\n\n"

    printf "Execute\n\n"

    printf "    engineer task execute %s\n\n" \
        "${task}"

}