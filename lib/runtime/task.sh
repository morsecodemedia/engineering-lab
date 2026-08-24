#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Task
################################################################################

runtime_task_execute() {

    local task="$1"

    local definition

    definition="$(
        runtime_task_definition "${task}"
    )"

    ############################################################################
    # Context
    ############################################################################

    local context_renderer
    local prompt_renderer
    local runtime
    local interpreter

    context_renderer="$(
        jq -r '.pipeline.context_renderer' <<< "${definition}"
    )"

    prompt="$(
        jq -r '.pipeline.prompt' <<< "${definition}"
    )"

    runtime="$(
        jq -r '.pipeline.runtime' <<< "${definition}"
    )"

    interpreter="$(
        jq -r '.pipeline.interpreter' <<< "${definition}"
    )"

    runtime_resolve "${runtime}" \
    | runtime_context_renderer "${context_renderer}" \
    | compose_knowledge_package "${prompt}" \
    | runtime_ai_infer

}