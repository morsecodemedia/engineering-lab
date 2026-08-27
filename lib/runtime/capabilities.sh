#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Capability Registry
################################################################################

runtime_capability_registry() {

    local knowledge_root

    knowledge_root="${ROOT}/knowledge"

    local domain
    local task

    for domain in "${knowledge_root}"/*; do

        [[ -d "${domain}" ]] || continue

        local capabilities=""

        for task in "${domain}"/*; do

            [[ -d "${task}" ]] || continue
            [[ -f "${task}/definition.json" ]] || continue

            local id
            local description

            id="$(
                jq -r '.id' \
                    "${task}/definition.json"
            )"

            description="$(
                jq -r '.description' \
                    "${task}/definition.json"
            )"

            capabilities+=$'\n'
            capabilities+="    ${id}"$'\n'
            capabilities+="        ${description}"$'\n'

        done

        [[ -z "${capabilities}" ]] && continue

        local domain_name

        domain_name="$(basename "${domain}")"

        printf "%s\n\n" "${domain_name^}"

        printf "%s\n" "${capabilities}"

    done

}