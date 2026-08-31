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
# Version
################################################################################

# shellcheck source=runtime/version.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/version.sh"

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
# Interactive REPL
################################################################################

# shellcheck source=runtime/repl.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/repl.sh"

################################################################################
# Conversation
################################################################################

# shellcheck source=conversation/history.sh
# shellcheck disable=SC1091
source "${ROOT}/lib/conversation/history.sh"

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
# Capability Registry
################################################################################

# shellcheck source=runtime/capabilities.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/capabilities.sh"

################################################################################
# Capability Invocation
################################################################################

# shellcheck source=runtime/capability.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/capability.sh"

################################################################################
# Product Identity
################################################################################

# shellcheck source=runtime/product-identity.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/product-identity.sh"

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

################################################################################
# Session
################################################################################

# shellcheck source=runtime/session.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/session.sh"

################################################################################
# Session Context
################################################################################

# shellcheck source=runtime/session-context.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/session-context.sh"

################################################################################
# Session Inference
################################################################################

# shellcheck source=runtime/session-inference.sh
# shellcheck disable=SC1091
source "${RUNTIME_DIR}/session-inference.sh"