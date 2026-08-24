#!/usr/bin/env bash

################################################################################
# Composer
#
# Knowledge Package
################################################################################

compose_knowledge_package() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: compose_knowledge_package <task-id>" >&2

        return 1

    fi

    local task="$1"

    local task_path

    task_path="$(
        printf "%s" "${task}" \
        | tr '.' '/'
    )"

    local instructions

    instructions="${ROOT}/knowledge/${task_path}/instructions.md"

    if [[ ! -f "${instructions}" ]]; then

        printf "%s\n" \
            "Instructions not found: ${task}" >&2

        return 1

    fi

    ############################################################################
    # Evidence
    ############################################################################

    local evidence

    evidence="$(
        cat
    )"

    if [[ -z "${evidence}" ]]; then

        printf "%s\n" \
            "No evidence provided." >&2

        return 1

    fi

    local content

    content="$(
        jq -r '.content' <<< "${evidence}"
    )"

    ############################################################################
    # Knowledge Package
    ############################################################################

    local task_dir

    task_dir="${ROOT}/knowledge/${task_path}"

    for document in \
        instructions.md \
        background.md \
        assumptions.md \
        principles.md \
        calibration.md \
        expectations.md
    do

        if [[ -f "${task_dir}/${document}" ]]; then

            cat "${task_dir}/${document}"

            printf "\n\n"

        fi

    done

    ############################################################################
    # Runtime Context
    ############################################################################

    printf "%s\n" "${content}"

}