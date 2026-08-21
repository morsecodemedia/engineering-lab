#!/usr/bin/env bash

################################################################################
# Runtime Service
#
# Project
################################################################################

runtime_project_state() {

    local project_root
    project_root="$PWD"

    local project_name
    project_name="$(basename "${project_root}")"

    local project_detected=true

    local project_type="unknown"
    local project_profile="generic"
    local framework=""

    local languages=()
    local package_managers=()

    ############################################################################
    # Languages
    ############################################################################

    #
    # PHP
    #

    if [[ -f "${project_root}/wp-config.php" ]] ||
      [[ -d "${project_root}/wp-content" ]] ||
      [[ -f "${project_root}/composer.json" ]] ||
      find "${project_root}" \
            -maxdepth 2 \
            -name "*.php" \
            -print -quit \
            | grep -q .; then

        languages+=("php")

    fi

    #
    # JavaScript
    #

    if [[ -f "${project_root}/package.json" ]] ||
      [[ -f "${project_root}/vite.config.js" ]] ||
      [[ -f "${project_root}/vite.config.ts" ]] ||
      [[ -f "${project_root}/vite.config.mjs" ]] ||
      find "${project_root}" \
            -maxdepth 2 \
            -name "*.js" \
            -o -name "*.mjs" \
            -o -name "*.cjs" \
            -o -name "*.ts" \
            -print -quit \
            | grep -q .; then

        languages+=("javascript")

    fi

    #
    # Bash
    #

    if find "${project_root}" \
        -maxdepth 2 \
        -name "*.sh" \
        -print -quit \
        | grep -q .; then

        languages+=("bash")

    fi

    #
    # Python
    #

    if [[ -f "${project_root}/pyproject.toml" ]] ||
      find "${project_root}" \
            -maxdepth 2 \
            -name "*.py" \
            -print -quit \
            | grep -q .; then

        languages+=("python")

    fi

    #
    # Go
    #

    if [[ -f "${project_root}/go.mod" ]]; then
        languages+=("go")
    fi

    #
    # Rust
    #

    if [[ -f "${project_root}/Cargo.toml" ]]; then
        languages+=("rust")
    fi

    ############################################################################
    # Package Managers
    ############################################################################

    [[ -f "${project_root}/package.json" ]] && package_managers+=("npm")
    [[ -f "${project_root}/composer.json" ]] && package_managers+=("composer")
    [[ -f "${project_root}/Cargo.toml" ]] && package_managers+=("cargo")
    [[ -f "${project_root}/go.mod" ]] && package_managers+=("go")
    [[ -f "${project_root}/pyproject.toml" ]] && package_managers+=("pip")

    ############################################################################
    # Project Detection
    ############################################################################

    #
    # WordPress
    #

    if [[ -f "${project_root}/wp-config.php" ]] ||
       [[ -d "${project_root}/wp-content" ]]; then

        project_type="wordpress"
        project_profile="php"

    #
    # Vite
    #

    elif [[ -f "${project_root}/vite.config.js" ]] ||
         [[ -f "${project_root}/vite.config.ts" ]] ||
         [[ -f "${project_root}/vite.config.mjs" ]]; then

        project_type="vite"
        project_profile="node"
        framework="Vite"

    #
    # Node
    #

    elif [[ -f "${project_root}/package.json" ]]; then

        project_type="node"
        project_profile="node"

    #
    # Shell Configuration
    #

    elif [[ -f "${project_root}/.profile" ]] &&
         [[ -d "${project_root}/.profile.d" ]]; then

        project_type="shell-configuration"
        project_profile="shell"

    fi

    ############################################################################
    # State
    ############################################################################

    jq -n \
        --arg root "${project_root}" \
        --arg name "${project_name}" \
        --arg type "${project_type}" \
        --arg profile "${project_profile}" \
        --arg framework "${framework}" \
        --argjson detected "${project_detected}" \
        --argjson languages "$(
            if ((${#languages[@]})); then
                printf '%s\n' "${languages[@]}" \
                    | jq -R . \
                    | jq -s .
            else
                printf '[]'
            fi
        )" \
        --argjson package_managers "$(
            if ((${#package_managers[@]})); then
                printf '%s\n' "${package_managers[@]}" \
                    | jq -R . \
                    | jq -s .
            else
                printf '[]'
            fi
        )" '
{
    schema: "project-state/v1",

    project: {
        detected: $detected,
        root: $root,
        name: $name,
        type: $type,
        profile: $profile,
        framework: $framework
    },

    languages: $languages,

    package_managers: $package_managers,

    warnings: []
}
'
}