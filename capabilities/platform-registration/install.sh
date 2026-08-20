#!/usr/bin/env bash

set -euo pipefail

################################################################################
# Platform Registration
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
# Installation
################################################################################

INSTALL_DIR="${HOME}/.config/engineering-lab"

mkdir -p "${INSTALL_DIR}"

tempfile="$(mktemp "${INSTALL_DIR}/installation.env.XXXXXX")"

sed \
    -e "s|{{INSTALLATION_SCHEMA}}|installation/v1|g" \
    -e "s|{{PRODUCT_ID}}|engineering-lab|g" \
    -e "s|{{PRODUCT_NAME}}|Engineering Lab|g" \
    -e "s|{{PRODUCT_ROOT}}|${ROOT}|g" \
    -e "s|{{PRODUCT_REPOSITORY}}|https://github.com/morsecodemedia/engineering-lab.git|g" \
    -e "s|{{PRODUCT_CHANNEL}}|development|g" \
    -e "s|{{PRODUCT_VERSION}}|1.0.0|g" \
    "${ROOT}/config/engineering-lab/installation.env.in" \
    > "${tempfile}"

mv -f "${tempfile}" "${INSTALL_DIR}/installation.env"

jq -n \
    --arg root "${ROOT}" '
{
    schema: "installation-state/v1",
    status: "installed",
    root: $root
}
'