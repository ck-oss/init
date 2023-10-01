#!/usr/bin/env sh

pnpm pkg set "scripts[format:check]"="prettier --check \"**/*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}\""
pnpm pkg set "scripts[format:fix]"="prettier --write \"**/*.{html,css,scss,js,cjs,mjs,jsx,ts,tsx,md,markdown,mdx,json,yml,yaml,gql,graphql}\""

pnpm pkg set "prettier"="@ck-oss/prettier-config"
