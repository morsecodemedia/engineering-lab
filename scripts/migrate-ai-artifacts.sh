#!/usr/bin/env bash

set -euo pipefail

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1
    pwd
)"

OLD_STORE="${HOME}/.local/share/engineering-lab/models"
NEW_STORE="${HOME}/.local/share/engineering-lab/artifacts/models"

printf "\n==> Creating artifact store\n"

mkdir -p "${NEW_STORE}"

###############################################################################
# Move existing models
###############################################################################

if [[ -d "${OLD_STORE}" ]]; then

    printf "==> Moving existing models\n"

    shopt -s nullglob

    for file in "${OLD_STORE}"/*; do
        mv "${file}" "${NEW_STORE}/"
    done

    shopt -u nullglob

    rmdir "${OLD_STORE}" 2>/dev/null || true

fi

###############################################################################
# Update repository templates
###############################################################################

printf "==> Updating templates\n"

find "${ROOT}/config/ai" \
    -type f \
    -name "*.env.in" \
    -exec sed -i '' \
        's|/\.local/share/engineering-lab/models|/.local/share/engineering-lab/artifacts/models|g' \
        {} +

###############################################################################
# Update generated configuration
###############################################################################

CONFIG="${HOME}/.config/engineering-lab/ai"

if [[ -d "${CONFIG}" ]]; then

    find "${CONFIG}" \
        -type f \
        -name "*.env" \
        -exec sed -i '' \
            's|/\.local/share/engineering-lab/models|/.local/share/engineering-lab/artifacts/models|g' \
            {} +

fi

###############################################################################
# Update source
###############################################################################

printf "==> Updating source\n"

find "${ROOT}/lib" \
    "${ROOT}/capabilities" \
    -type f \
    -name "*.sh" \
    -exec sed -i '' \
        's|/\.local/share/engineering-lab/models|/.local/share/engineering-lab/artifacts/models|g' \
        {} +

###############################################################################
# Summary
###############################################################################

printf "\nMigration complete.\n\n"

printf "Artifact Store\n"
printf "%s\n" "--------------"

du -sh "${HOME}/.local/share/engineering-lab/artifacts" 2>/dev/null || true

printf "\nModels\n"
printf "%s\n" "------"

find "${NEW_STORE}" -maxdepth 1 -type f 2>/dev/null