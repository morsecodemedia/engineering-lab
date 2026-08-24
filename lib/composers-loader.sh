#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

COMPOSER_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Knowledge Composer
################################################################################

# shellcheck source=composers/knowledge.sh
# shellcheck disable=SC1091
source "${COMPOSER_DIR}/composers/knowledge.sh"