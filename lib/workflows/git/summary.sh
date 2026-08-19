#!/usr/bin/env bash

################################################################################
# Git Workflow
#
# Generate a suggested commit message from staged changes.
################################################################################

git_workflow_summary() {

    local diff
    local query

    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        engineering_error "Engineering Lab: not inside a Git repository." >&2
        return 1
    fi

    diff="$(
        git --no-pager diff --cached
    )"

    if [[ -z "${diff}" ]]; then
        engineering_error "Engineering Lab: no staged changes."
        printf "Stage changes before generating a commit summary.\n" >&2
        return 1
    fi

    query=$(
        cat <<'EOF'
Generate a concise, well-structured Git commit message for the staged changes.

Requirements:

- First line is a short summary (50-72 characters).
- Blank line.
- Follow with bullet points describing the significant changes.
- Describe what changed, not implementation trivia.
- Use imperative mood.
EOF
    )

    if ! command -v sgpt >/dev/null 2>&1; then
        engineering_error "Engineering Lab: no AI provider is available."
        printf "Install or configure an AI provider before using gsum.\n" >&2
        return 1
    fi

    if ! commit_message="$(
        sgpt "${query}

    ${diff}"
    )"; then

        engineering_error "Engineering Lab: commit summary generation failed."
        printf "Verify your AI provider is configured correctly.\n" >&2
        return 1

    fi

    printf "%s\n" "${commit_message}"

}