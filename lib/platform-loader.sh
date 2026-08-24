#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

BOOTSTRAP_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Runtime
################################################################################

# shellcheck source=runtime-loader.sh
# shellcheck disable=SC1091
source "${BOOTSTRAP_DIR}/runtime-loader.sh"

################################################################################
# Renderers
################################################################################

# shellcheck source=renderers-loader.sh
# shellcheck disable=SC1091
source "${BOOTSTRAP_DIR}/renderers-loader.sh"

################################################################################
# Evidence
################################################################################

# shellcheck source=evidence-loader.sh
# shellcheck disable=SC1091
source "${BOOTSTRAP_DIR}/evidence-loader.sh"

################################################################################
# Composers
################################################################################

# shellcheck source=composers-loader.sh
# shellcheck disable=SC1091
source "${BOOTSTRAP_DIR}/composers-loader.sh"