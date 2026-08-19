#!/usr/bin/env bash

################################################################################
# Git Workflow
#
# Interactively browse Git history.
################################################################################

git_workflow_history() {

    #
    # Verify Git repository.
    #
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        engineering_error "Not inside a Git repository."
        return 1
    fi

    #
    # Verify fzf.
    #
    if ! command -v fzf >/dev/null 2>&1; then
        engineering_error "fzf is not available."
        printf "Install fzf to browse Git history.\n" >&2
        return 1
    fi

    local selection
    local query=""
    local key
    local commits
    local commit

    while selection="$(
        git log \
            --graph \
            --color=always \
            --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" \
            "$@" \
        | fzf \
            --ansi \
            --multi \
            --no-sort \
            --reverse \
            --query="${query}" \
            --print-query \
            --expect=ctrl-d \
            --toggle-sort='`' \
            --header=$'ENTER  View commit\nCTRL-D Diff commit\n`      Toggle sort'
    )"; do

        query="$(
            printf "%s\n" "${selection}" \
                | sed -n '1p'
        )"

        key="$(
            printf "%s\n" "${selection}" \
                | sed -n '2p'
        )"

        commits="$(
            printf "%s\n" "${selection}" \
                | sed '1,2d;s/^[^a-z0-9]*//;/^$/d' \
                | awk '{print $1}'
        )"

        [[ -n "${commits}" ]] || continue

        if [[ "${key}" == "ctrl-d" ]]; then

            git --no-pager diff --color=always ${commits} | less -R

            continue

        fi

        while read -r commit; do

            [[ -n "${commit}" ]] || continue

            git --no-pager show --color=always "${commit}" | less -R

        done <<< "${commits}"

    done

}