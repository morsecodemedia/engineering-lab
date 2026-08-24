#!/usr/bin/env bash

################################################################################
# Evidence Provider
#
# Engineering Context
################################################################################

evidence_context() {

    local context

    context="$(
        runtime_context_state \
        | render_context_markdown
    )"

    jq -n \
        --arg content "${context}" \
        '
{
    schema: "evidence/v1",

    id: "engineering.context",

    type: "markdown",

    producer: "runtime.context",

    content: $content
}
'

}