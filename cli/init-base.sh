#!/usr/bin/env sh

# Check if the cwd is a git repository
if [ -d ".git" ]; then
    # If it is a git repository

    # Setup husky
    pnpm dlx husky-init
    pnpm exec husky set .husky/pre-commit "pnpm exec lint-staged"
    pnpm exec husky set .husky/commit-msg "pnpm exec commitlint --edit \$1"

    # Install deps
    pkgs="@commitlint/cli @commitlint/config-conventional @commitlint/cz-commitlint commitizen lint-staged"

    # Check if the cwd is a pnpm workspace
    if [ -f "pnpm-workspace.yaml" ]; then
        # If it is a workspace
        pnpm add -w -D $pkgs
    else
        # If it is not a workspace
        pnpm add -D $pkgs
    fi

    # Setup scripts
    pnpm pkg set "scripts[commit]"="cz"

    # Setup configs
    pnpm pkg set "commitlint[extends][0]"="@commitlint/config-conventional"
    pnpm pkg set "lint-staged[*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}][0]"="prettier --write"
    pnpm pkg set "config[commitizen][path]"="@commitlint/cz-commitlint"
else
    # If it is not a git repository
    echo "Error: No git directory found. Please initialize a git repository first."
    exit 1
fi
