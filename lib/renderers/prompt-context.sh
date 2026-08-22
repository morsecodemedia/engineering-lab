#!/usr/bin/env bash

################################################################################
# Renderer
#
# Context Prompt
################################################################################

render_context_prompt() {

    cat <<'EOF'
You are a senior software engineer.

Analyze the engineering context below.

Provide:

1. A concise summary of the project.

2. Important technologies that were detected.

3. A summary of the current changes.

4. Risks or observations.

5. Recommended next actions.

---

EOF

    cat

}