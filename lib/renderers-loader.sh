#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

RENDERER_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Context Prompt
################################################################################

# shellcheck source=renderers/prompt-context.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/prompt-context.sh"

################################################################################
# Context
################################################################################

# shellcheck source=renderers/context.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/context.sh"

################################################################################
# Runtime
################################################################################

# shellcheck source=renderers/runtime.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/runtime.sh"


################################################################################
# Prompt Runtime
################################################################################

# shellcheck source=renderers/prompt-runtime.sh
# shellcheck disable=SC1091
source "${RENDERER_DIR}/renderers/prompt-runtime.sh"
