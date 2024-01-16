import stylistic from '@stylistic/eslint-plugin'

export default [
  stylistic.configs.customize({
    indent: 2,
    quotes: 'single',
    semi: false,
  }),
  { files: ['**/*.ts', '**/*.js'] },
]
