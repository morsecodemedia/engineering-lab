#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Git
################################################################################

runtime_git_state() {

    if ! git rev-parse --show-toplevel >/dev/null 2>&1; then

        jq -n '
{
    schema: "git-state/v1",

    repository: false,

    warnings: [
        "Not inside a Git repository."
    ]
}
'

        return

    fi

    local repository_root
    local branch
    local tracking_branch=""

    local modified=0
    local untracked=0
    local staged=0

    local working_tree="clean"

    local ahead=0
    local behind=0

    ############################################################################
    # Repository
    ############################################################################

    repository_root="$(
        git rev-parse --show-toplevel
    )"

    branch="$(
        git branch --show-current
    )"

    ############################################################################
    # Working Tree
    ############################################################################

    while IFS= read -r line; do

        [[ -z "${line}" ]] && continue

        working_tree="modified"

        index="${line:0:1}"
        worktree="${line:1:1}"

        if [[ "${index}" != " " && "${index}" != "?" ]]; then
            (( ++staged ))
        fi

        if [[ "${worktree}" == "M" ]]; then
            (( ++modified ))
        fi

        if [[ "${index}${worktree}" == "??" ]]; then
            (( ++untracked ))
        fi

    done < <(git status --porcelain)

    ############################################################################
    # Tracking
    ############################################################################

    if git rev-parse --abbrev-ref "@{upstream}" >/dev/null 2>&1; then

        tracking_branch="$(
            git rev-parse --abbrev-ref "@{upstream}"
        )"

        read -r ahead behind < <(
            git rev-list \
                --left-right \
                --count \
                "HEAD...@{upstream}"
        )

    fi

    ############################################################################
    # State
    ############################################################################

    jq -n \
        --arg repository_root "${repository_root}" \
        --arg branch "${branch}" \
        --arg tracking_branch "${tracking_branch}" \
        --arg working_tree_status "${working_tree}" \
        --argjson modified "${modified}" \
        --argjson untracked "${untracked}" \
        --argjson staged "${staged}" \
        --argjson ahead "${ahead}" \
        --argjson behind "${behind}" '
{
    schema: "git-state/v1",

    repository: {
        present: true,
        root: $repository_root
    },

    branch: $branch,

    tracking: {
        branch: $tracking_branch,
        ahead: $ahead,
        behind: $behind
    },

    working_tree: {
        status: $working_tree_status,
        modified: $modified,
        untracked: $untracked,
        staged: $staged
    },

    warnings: []
}
'
}