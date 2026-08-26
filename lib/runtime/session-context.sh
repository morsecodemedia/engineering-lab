#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Interactive Session Context
################################################################################

runtime_session_context() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_session_context <session-state>" >&2

        return 1

    fi

    local session="$1"

    local workspace

    workspace="$(
        jq -r '.workspace' <<< "${session}"
    )"

    cat <<EOF
Engineering Lab

================================================================================
Product
================================================================================

Engineering Lab

Mode

    Interactive

================================================================================
Workspace
================================================================================

$(if [[ -n "${workspace}" ]]; then
    printf "%s\n" "${workspace}"
else
    printf "None\n"
fi)

================================================================================
Capabilities
================================================================================

Repository

    repository.review
        Review the current engineering activity.

    repository.summarize
        Summarize the current engineering repository.

Technology

    technology.explain
        Explain engineering concepts.

    technology.recommend
        Recommend engineering technologies.

================================================================================
Session
================================================================================

Workspace Context

    $(if [[ -n "${workspace}" ]]; then
        printf "Available\n"
    else
        printf "Unavailable\n"
    fi)

Capability Registry

    Loaded

Knowledge Packages

    Loaded

Personal Knowledge

    Not Configured

EOF

}