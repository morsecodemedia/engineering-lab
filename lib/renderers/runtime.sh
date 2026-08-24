#!/usr/bin/env bash

################################################################################
# Renderer Runtime
################################################################################

context_renderer_resolve() {

    if (($# != 1)); then
        printf "%s\n" \
            "Usage: context_renderer_resolve <renderer-id>" >&2
        return 1
    fi

    case "$1" in

        engineering.context.markdown)

            declare -F render_context_markdown >/dev/null

            ;;

        *)

            printf "Unknown context renderer: %s\n" "$1" >&2

            return 1

            ;;

    esac

}

################################################################################
# Context Renderer
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

            printf "Unknown context renderer: %s\n" "$1" >&2

            return 1

            ;;

    esac

}