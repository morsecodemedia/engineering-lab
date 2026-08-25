#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Version
################################################################################

runtime_version() {

    local manifest

    manifest="${HOME}/.config/engineering-lab/installation.env"

    if [[ ! -r "${manifest}" ]]; then

        printf "%s\n" \
            "Engineering Lab is not registered." >&2

        return 1

    fi

    # shellcheck disable=SC1090
    source "${manifest}"

    printf "\n"

    printf "%s\n" "${PRODUCT_NAME}"
    printf "────────────────────────────────────────\n\n"

    printf "Version\n\n"
    printf "    %s\n\n" "${PRODUCT_VERSION} (${PRODUCT_CHANNEL})"

    printf "Installation\n\n"
    printf "    %s\n\n" "${PRODUCT_ROOT}"

    printf "Executable\n\n"
    printf "    %s\n\n" "$(command -v engineer)"

}