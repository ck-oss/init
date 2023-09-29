const { JAVASCRIPT_FILES } = require("./constants");

/** @type {import('eslint').Linter.Config} */
module.exports = {
  extends: [
    "./base",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "plugin:jsx-a11y/recommended",
    "plugin:import/react",
    "plugin:@next/next/recommended",
    "plugin:next-on-pages/recommended",
    "turbo",
    "prettier",
  ],
  env: {
    browser: true,
    node: true,
  },
  globals: {
    React: true,
    JSX: true,
  },
  overrides: [
    {
      files: JAVASCRIPT_FILES,
      parserOptions: {
        babelOptions: {
          presets: ["next/babel"],
        },
      },
    },
  ],
};
