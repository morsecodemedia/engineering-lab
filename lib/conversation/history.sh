#!/usr/bin/env bash

################################################################################
# Conversation Service
#
# History
################################################################################

conversation_history_new() {

    printf ""

}

################################################################################
# Conversation Service
#
# Append User Message
################################################################################

conversation_history_append_user() {

    if (($# != 2)); then

        printf "%s\n" \
            "Usage: conversation_history_append_user <history> <message>" >&2

        return 1

    fi

    local history="$1"
    local message="$2"

    printf "%s\n\nUser\n%s\n" \
        "${history}" \
        "${message}"

}

################################################################################
# Conversation Service
#
# Append Assistant Message
################################################################################

conversation_history_append_assistant() {

    if (($# != 2)); then

        printf "%s\n" \
            "Usage: conversation_history_append_assistant <history> <message>" >&2

        return 1

    fi

    local history="$1"
    local message="$2"

    printf "%s\n\nAssistant\n%s\n" \
        "${history}" \
        "${message}"

}