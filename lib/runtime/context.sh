#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Context
################################################################################

runtime_context_state() {

    jq -n \
        --argjson project "$(runtime_project_state)" \
        --argjson git "$(runtime_git_state)" \
        --argjson changes "$(runtime_changes_state)" '
{
    schema: "context-state/v1",

    project: $project,

    git: $git,

    changes: $changes,

    warnings: (
        ($project.warnings // [])
        +
        ($git.warnings // [])
        +
        ($changes.warnings // [])
    )
}
'

}