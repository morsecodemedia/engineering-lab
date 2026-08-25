#!/usr/bin/env bash

################################################################################
# CLI
################################################################################

cli_dispatch() {

    local command="${1:-}"

    if [[ -z "${command}" ]]; then

        cli_home

        return

    fi

    case "${command}" in

        task)

            shift

            cli_task "$@"

            ;;

        knowledge)

            shift

            cli_knowledge "$@"

            ;;

        version)

            shift

            "${ROOT}/capabilities/version.sh"

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

        list)

            shift

            "${ROOT}/capabilities/task/list.sh" "$@"

            ;;

        info)

            shift

            "${ROOT}/capabilities/task/info.sh" "$@"

            ;;

        *)

            printf "%s\n" \
                "Unknown task command: ${command}" >&2

            return 1

            ;;

    esac

}


################################################################################
# Knowledge
################################################################################

cli_knowledge() {

    local command="${1:-}"

    case "${command}" in

        validate)

            shift

            "${ROOT}/capabilities/knowledge/validate.sh" "$@"

            ;;

        info)

            shift

            "${ROOT}/capabilities/knowledge/info.sh" "$@"

            ;;

        *)

            printf "%s\n" \
                "Unknown knowledge command: ${command}" >&2

            return 1

            ;;

    esac

}

################################################################################
# Home
################################################################################

cli_home() {

    printf "\n"

    printf "Engineering Lab\n"
    printf "────────────────────────────────────────\n\n"

    printf "Knowledge-Driven Engineering Platform\n\n"

    printf "Engineering Capabilities\n\n"

    printf "    Discover available engineering capabilities.\n\n"

    printf "        engineer task list\n\n"

    printf "Knowledge Packages\n\n"

    printf "    Inspect and validate engineering knowledge.\n\n"

    printf "        engineer knowledge info <task>\n"
    printf "        engineer knowledge validate <task>\n\n"

    printf "Getting Started\n\n"

    printf "    1. Discover available capabilities.\n"
    printf "    2. Inspect a capability.\n"
    printf "    3. Execute the capability.\n\n"

    printf "        engineer task list\n"
    printf "        engineer task info repository.review\n"
    printf "        engineer task execute repository.review\n\n"

}