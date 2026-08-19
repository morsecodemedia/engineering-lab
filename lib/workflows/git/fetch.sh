#!/usr/bin/env bash

################################################################################
# Git Workflow
#
# Synchronize remote tracking branches.
################################################################################

git_workflow_fetch_all() {

    git fetch --all --prune || return

    local remote
    local branch

    git branch -r \
        | grep -v '->' \
        | while read -r remote; do

            branch="${remote#origin/}"

            if git show-ref --verify --quiet "refs/heads/${branch}"; then
                continue
            fi

            printf 'Tracking %s\n' "${remote}"

            git branch --track "${branch}" "${remote}"

        done

}