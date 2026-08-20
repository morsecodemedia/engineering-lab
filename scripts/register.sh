#!/usr/bin/env bash

set -euo pipefail

ROOT="$(
    cd "$(dirname "${BASH_SOURCE[0]}")/.." >/dev/null 2>&1 || exit
    pwd
)"

"${ROOT}/capabilities/platform-registration/install.sh"