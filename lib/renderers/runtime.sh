#!/usr/bin/env bash

################################################################################
# Renderer Runtime
################################################################################

runtime_context_renderer() {

    if (($# != 1)); then
        printf "%s\n" \
            "Usage: runtime_context_renderer <renderer-id>" >&2
        return 1
    fi

    case "$1" in

        engineering.context.markdown)

            render_context_markdown

            ;;

        *)

            printf "%s\n" \
                "Unknown context renderer: $1" >&2

            return 1

            ;;

    esac

}