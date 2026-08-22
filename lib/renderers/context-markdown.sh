#!/usr/bin/env bash

set -euo pipefail

jq -r '

"# Engineering Context",

"",


"## Project",

"- Name: \(.project.project.name)",
"- Type: \(.project.project.type)",
"- Profile: \(.project.project.profile)",

(if .project.project.framework != "" then
    "- Framework: \(.project.project.framework)"
else
    empty
end),

"",
"## Languages",

(.project.languages[]? | "- \(.)"),

"",
"## Package Managers",

(.project.package_managers[]? | "- \(.)"),

"",
"## Git",

"- Branch: \(.git.branch)",
"- Tracking: \(.git.tracking.branch)",
"- Working Tree: \(.git.working_tree.status)",

"",
"## Changes",

"- Modified: \(.changes.changes.summary.modified)",
"- Untracked: \(.changes.changes.summary.untracked)",
"- Staged: \(.changes.changes.summary.staged)",

"",
"### Changed Files",

(.changes.changes.files[]? | "- \(.)")

'