#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

EVIDENCE_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Evidence Runtime
################################################################################

# shellcheck source=evidence/runtime.sh
# shellcheck disable=SC1091
source "${EVIDENCE_DIR}/evidence/runtime.sh"

################################################################################
# Evidence Providers
################################################################################

# shellcheck source=evidence/context.sh
# shellcheck disable=SC1091
source "${EVIDENCE_DIR}/evidence/context.sh"