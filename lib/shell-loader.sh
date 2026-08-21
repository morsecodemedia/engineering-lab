#!/usr/bin/env bash

################################################################################
# Repository
################################################################################

SHELL_DIR="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/shell" >/dev/null 2>&1 || exit
    pwd
)"

################################################################################
# Shell
################################################################################

# shellcheck source=shell/system.sh
# shellcheck disable=SC1091
source "${SHELL_DIR}/system.sh"

# shellcheck source=shell/git.sh
# shellcheck disable=SC1091
source "${SHELL_DIR}/git.sh"

# shellcheck source=shell/tmux.sh
# shellcheck disable=SC1091
source "${SHELL_DIR}/tmux.sh"

# shellcheck source=shell/vim.sh
# shellcheck disable=SC1091
source "${SHELL_DIR}/vim.sh"