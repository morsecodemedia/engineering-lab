#!/usr/bin/env bash

################################################################################
# Runtime Resolver
################################################################################

runtime_resolve() {

    if (($# != 1)); then
        printf "%s\n" \
            "Usage: runtime_resolve <runtime-id>" >&2
        return 1
    fi

    case "$1" in

        engineering.context)

            runtime_context_state

            ;;

        *)

            printf "%s\n" \
                "Unknown runtime: $1" >&2
            return 1

            ;;

    esac

}