#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# DDEV
################################################################################

runtime_ddev_state() {

    local installed=false
    local version=""

    #
    # Installation
    #

    if command -v ddev >/dev/null 2>&1; then

        installed=true

        version="$(
            ddev version 2>/dev/null \
                | awk '$1 == "DDEV" && $2 == "version" { print $3 }'
        )"

    fi

    jq -n \
        --argjson installed "${installed}" \
        --arg version "${version}" '
{
    schema: "ddev-state/v1",

    installed: $installed,

    version: $version,

    warnings: []
}
'

}