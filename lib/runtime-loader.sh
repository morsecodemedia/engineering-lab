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
# AI Inference
################################################################################

# shellcheck source=runtime/inference.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/inference.sh"

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

################################################################################
# Task
################################################################################

# shellcheck source=runtime/task.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/task.sh"

################################################################################
# Tasks
################################################################################

# shellcheck source=runtime/tasks.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/tasks.sh"

################################################################################
# Task Definition
################################################################################

# shellcheck source=runtime/task-definition.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/task-definition.sh"

################################################################################
# Task Information
################################################################################

# shellcheck source=runtime/task-info.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/task-info.sh"

################################################################################
# Runtime Resolver
################################################################################

# shellcheck source=runtime/resolver.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/resolver.sh"

################################################################################
# Knowledge
################################################################################

# shellcheck source=runtime/knowledge.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/knowledge.sh"

################################################################################
# Knowledge Information
################################################################################

# shellcheck source=runtime/knowledge-info.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/knowledge-info.sh"