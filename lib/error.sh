#!/usr/bin/env bash

################################################################################
# Engineering Lab
#
# Error Reporting
################################################################################

engineering_error() {

    [[ $# -eq 1 ]] || return 1

    printf "Engineering Lab: %s\n" "$1" >&2

}