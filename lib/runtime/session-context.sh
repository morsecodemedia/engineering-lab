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
$(runtime_product_identity)

================================================================================
Product
================================================================================

Name

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
Engineering Capabilities
================================================================================

$(runtime_capability_registry)

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