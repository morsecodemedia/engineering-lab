#!/usr/bin/env bash

set -euo pipefail

jq -r '

"Docker",
"======",
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

"Engine",
"------",

(
    if .engine_available
    then "✓ Available"
    else "✗ Unavailable"
    end
),

"",

"Provider",
"--------",

(
    if .provider == ""
    then "Unknown"
    else .provider
    end
),

"",

"Version",
"-------",

(
    if .version.client == ""
    then "Unknown"
    else .version.client
    end
)

'