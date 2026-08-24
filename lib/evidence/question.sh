#!/usr/bin/env bash

################################################################################
# Evidence Provider
#
# Engineering Question
################################################################################

evidence_question() {

    local question

    question="$(
        cat
    )"

    if [[ -z "${question}" ]]; then

        printf "%s\n" \
            "No engineering question provided." >&2

        return 1

    fi

    jq -n \
        --arg content "${question}" \
        '
{
    schema: "evidence/v1",

    id: "engineering.question",

    type: "text",

    producer: "stdin",

    content: $content
}
'

}