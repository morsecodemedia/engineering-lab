#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Docker
################################################################################

runtime_docker_state() {

    local installed=false
    local engine_available=false

    local provider=""

    local client_version=""
    local server_version=""

    #
    # Installation
    #

    if command -v docker >/dev/null 2>&1; then

        installed=true

        client_version="$(
            docker version \
                --format '{{.Client.Version}}' \
                2>/dev/null || true
        )"

    fi

    #
    # Engine
    #

    if [[ "${installed}" == true ]]; then

        server_version="$(
            docker version \
                --format '{{.Server.Version}}' \
                2>/dev/null || true
        )"

        if [[ -n "${server_version}" ]]; then

            engine_available=true

        fi

    fi

    #
    # Provider
    #

    if [[ -d "/Applications/Docker.app" ]]; then

        provider="docker-desktop"

    elif [[ -d "/Applications/OrbStack.app" ]]; then

        provider="orbstack"

    elif command -v colima >/dev/null 2>&1; then

        provider="colima"

    fi

    jq -n \
        --argjson installed "${installed}" \
        --argjson engine_available "${engine_available}" \
        --arg provider "${provider}" \
        --arg client "${client_version}" \
        --arg server "${server_version}" '
{
    schema: "docker-state/v1",

    installed: $installed,

    engine_available: $engine_available,

    provider: $provider,

    version: {
        client: $client,
        server: $server
    },

    warnings: []
}
'

}