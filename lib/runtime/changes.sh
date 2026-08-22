#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Changes
################################################################################

runtime_changes_state() {

    if ! git rev-parse --show-toplevel >/dev/null 2>&1; then

        jq -n '
{
    schema: "changes-state/v1",

    repository: false,

    warnings: [
        "Not inside a Git repository."
    ]
}
'

        return

    fi

    local modified=0
    local untracked=0
    local staged=0

    local changes_present=false

    local files=()

    ############################################################################
    # Collection
    ############################################################################

    while IFS= read -r line; do

        [[ -z "${line}" ]] && continue

        local index="${line:0:1}"
        local worktree="${line:1:1}"
        local file="${line:3}"

        files+=("${file}")

        #
        # Staged
        #

        if [[ "${index}" != " " && "${index}" != "?" ]]; then
            (( ++staged ))
        fi

        #
        # Modified
        #

        if [[ "${worktree}" == "M" ]]; then
            (( ++modified ))
        fi

        #
        # Untracked
        #

        if [[ "${index}${worktree}" == "??" ]]; then
            (( ++untracked ))
        fi

    done < <(git status --porcelain)

    ############################################################################
    # State
    ############################################################################

    if (( modified + untracked + staged > 0 )); then
        changes_present=true
    fi

    jq -n \
        --argjson changes_present "${changes_present}" \
        --argjson files "$(
            if ((${#files[@]})); then
                printf '%s\n' "${files[@]}" \
                    | jq -R . \
                    | jq -s .
            else
                printf '[]'
            fi
        )" \
        --argjson modified "${modified}" \
        --argjson untracked "${untracked}" \
        --argjson staged "${staged}" '
{
    schema: "changes-state/v1",

    repository: true,

    changes: {
        present: $changes_present,

        files: $files,

        summary: {
            modified: $modified,
            untracked: $untracked,
            staged: $staged
        }
    },

    warnings: []
}
'

}