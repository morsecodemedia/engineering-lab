#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

LIB_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

RUNTIME_DIR="${LIB_DIR}/runtime"

################################################################################
# Runtime
################################################################################

# shellcheck source=runtime/docker.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/docker.sh"

# shellcheck source=runtime/ddev.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/ddev.sh"

################################################################################
# AI
################################################################################

# shellcheck source=runtime/ai.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/ai.sh"

################################################################################
# Project
################################################################################

# shellcheck source=runtime/project.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/project.sh"

################################################################################
# Git
################################################################################

# shellcheck source=runtime/git.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/git.sh"

################################################################################
# Changes
################################################################################

# shellcheck source=runtime/changes.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/changes.sh"

################################################################################
# Context
################################################################################

# shellcheck source=runtime/context.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/context.sh"