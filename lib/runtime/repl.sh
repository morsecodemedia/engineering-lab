#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Interactive REPL
################################################################################

runtime_repl() {

    local history

    history="$(
        conversation_history_new
    )"

    while true; do

        printf "\n> "

        IFS= read -r prompt || break

        case "${prompt}" in

            /exit)
                printf "\n"
                break
                ;;

        esac

        history="$(
            conversation_history_append_user \
                "${history}" \
                "${prompt}"
        )"

        local response

        response="$(
            printf "%s" "${history}" \
            | runtime_ai_infer
        )"

        printf "\n%s\n" "${response}"

        history="$(
            conversation_history_append_assistant \
                "${history}" \
                "${response}"
        )"

    done

}