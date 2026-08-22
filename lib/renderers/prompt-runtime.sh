#!/usr/bin/env bash

################################################################################
# Prompt Renderer Runtime
################################################################################

runtime_prompt_renderer() {

    if (($# != 1)); then

        printf "%s\n" \
            "Usage: runtime_prompt_renderer <renderer-id>" >&2

        return 1

    fi

    case "$1" in

        engineering.prompt.repository.summarize)

            render_context_prompt

            ;;

        *)

            printf "%s\n" \
                "Unknown prompt renderer: %s\n" "$1" >&2

            return 1

            ;;

    esac

}