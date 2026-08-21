#!/usr/bin/env bash

################################################################################
# System Workflow
#
# Interactively terminate one or more processes.
################################################################################

system_workflow_kill() {

    local signal
    local pids

    signal="${1:-15}"

    pids="$(
        ps -ef \
            | sed 1d \
            | fzf --multi \
            | awk '{print $2}'
    )"

    [[ -n "${pids}" ]] || return

    while read -r pid; do
        [[ -n "${pid}" ]] || continue
        kill -"${signal}" "${pid}"
    done <<< "${pids}"

}