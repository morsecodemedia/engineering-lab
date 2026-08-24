#!/usr/bin/env bash

################################################################################
# Evidence Service
#
# Runtime
################################################################################

evidence_resolve() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: evidence_resolve <evidence-id>" >&2

        return 1

    fi

    case "$1" in

        engineering.context)

            evidence_context

            ;;

        *)

            printf "Unknown evidence: %s\n" "$1" >&2

            return 1

            ;;

    esac

}