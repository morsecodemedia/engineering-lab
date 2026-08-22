#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

RENDERER_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Context Renderers
################################################################################

# shellcheck source=renderers/context/markdown.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/context/markdown.sh"

################################################################################
# Prompt Renderer
################################################################################

# shellcheck source=renderers/prompts.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/prompts.sh"

################################################################################
# Renderer Runtime
################################################################################

# shellcheck source=renderers/runtime.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/runtime.sh"