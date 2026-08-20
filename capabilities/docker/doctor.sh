#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Repository
################################################################################

SCRIPT_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

ROOT="$(
    cd "${SCRIPT_DIR}/../.." >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Runtime
################################################################################

# shellcheck source=../../lib/runtime-loader.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/runtime-loader.sh"

################################################################################
# Docker
################################################################################

docker_state="$(
    runtime_docker_state
)"

installed="$(
    printf "%s\n" "${docker_state}" \
        | jq -r '.installed'
)"

engine_available="$(
    printf "%s\n" "${docker_state}" \
        | jq -r '.engine_available'
)"

provider="$(
    printf "%s\n" "${docker_state}" \
        | jq -r '.provider'
)"

################################################################################
# Diagnosis
################################################################################

printf "%s\n" "Docker Doctor"
printf "%s\n" "============="

if [[ "${installed}" != "true" ]]; then

    printf "%s\n" "Status"
    printf "%s\n" "------"

    printf "Docker is not installed.\n\n"

    printf "%s\n" "Next Steps"
    printf "%s\n" "----------"

    printf "Install Docker Desktop.\n\n"

    printf "    engineer docker install\n"

    exit 1

fi

if [[ "${engine_available}" != "true" ]]; then

    printf "%s\n" "Status"
    printf "%s\n" "------"

    printf "Docker is installed but the engine is unavailable.\n\n"

    printf "%s\n" "Provider"
    printf "%s\n" "--------"

    printf "%s\n\n" "${provider}"

    printf "%s\n" "Next Steps"
    printf "%s\n" "----------"

    printf "Start Docker Desktop and retry.\n"

    exit 1

fi

printf "%s\n" "Status"
printf "%s\n" "------"

printf "Docker is healthy.\n"

exit 0