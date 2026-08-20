#!/usr/bin/env bash

set -euo pipefail

jq -r '

"DDEV",
"====",
"",

"Installation",
"------------",

(
    if .installed
    then "✓ Installed"
    else "✗ Not Installed"
    end
),

"",

"Version",
"-------",

(
    if .version == ""
    then "Unknown"
    else .version
    end
)

'