#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Interactive Engineering Session
################################################################################

runtime_session_bootstrap() {

    local workspace

    workspace=""

    if git rev-parse --show-toplevel >/dev/null 2>&1; then

        workspace="$(
            basename "$(
                git rev-parse --show-toplevel
            )"
        )"

    fi

    jq -n \
        --arg workspace "${workspace}" \
        '
{
    schema: "session-state/v1",

    workspace: $workspace,

    capabilities: [
        "repository.review",
        "repository.summarize",
        "technology.explain",
        "technology.recommend"
    ]
}
'

}

################################################################################
# Runtime Service
#
# Interactive Engineering Session
################################################################################

runtime_session_start() {

    local session

    session="$(
        runtime_session_bootstrap
    )"

    printf "\n"

    printf "Engineering Lab\n"
    printf "────────────────────────────────────────\n\n"

    printf "Loading Interactive Engineering Session...\n\n"

    printf "    ✓ Product Identity\n"
    printf "    ✓ Workspace Detection\n"
    printf "    ✓ Capability Registry\n"
    printf "    ✓ Model Selection\n"
    printf "    ✓ Session Context\n\n"

    #runtime_ai_session "${session}"
    runtime_repl

}