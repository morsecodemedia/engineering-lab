#!/usr/bin/env bash

################################################################################
# CLI
################################################################################

cli_dispatch() {

    local command="${1:-}"

    case "${command}" in

        task)

            shift

            cli_task "$@"

            ;;

        *)

            printf "%s\n" \
                "Unknown command: ${command}" >&2

            return 1

            ;;

    esac

}

################################################################################
# Task
################################################################################

cli_task() {

    local command="${1:-}"

    case "${command}" in

        execute)

            shift

            "${ROOT}/capabilities/task/execute.sh" "$@"

            ;;

        *)

            printf "%s\n" \
                "Unknown task command: ${command}" >&2

            return 1

            ;;

    esac

}