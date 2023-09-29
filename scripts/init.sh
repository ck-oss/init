#!/usr/bin/env sh

if [ -d ".git" ]; then
    pnpm dlx husky-init
    pnpm exec husky set .husky/pre-commit "pnpm exec lint-staged"
    pnpm exec husky set .husky/commit-msg "pnpm exec commitlint --edit \$1"

    pnpm pkg set "scripts[commit]"="cz"
    pnpm pkg set "scripts[format:check]"="prettier --check \"*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}\""
    pnpm pkg set "scripts[format:fix]"="prettier --fix \"*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}\""

    pnpm pkg set "commitlint.extends[0]"="@commitlint/config-conventional"
    pnpm pkg set "lint-staged[*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}]"="prettier --write"
    pnpm pkg set "config.commitizen.path"="@commitlint/cz-commitlint"
    pnpm pkg set "prettier"="@ck-oss/init/prettier"
else
    echo "Error: No git directory found. Please initialize a git repository first."
    exit 1
fi
