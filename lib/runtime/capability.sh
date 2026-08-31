#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Capability Invocation
################################################################################

runtime_capability_invoke() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_capability_invoke <capability>" >&2

        return 1

    fi

    local capability="$1"

    engineer task execute "${capability}"

}