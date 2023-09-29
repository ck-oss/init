#!/usr/bin/env sh

pnpm pkg set "scripts[lint]"="eslint ."
pnpm pkg set "scripts[lint:fix]"="eslint --fix ."

pnpm pkg set "eslintConfig.extends[0]"="@ck-oss/init/eslint/node"
