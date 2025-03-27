local mason_dir = vim.fn.stdpath("data") .. "/mason/bin/"
return {
  init_options = { hostInfo = 'neovim' },
  cmd = { mason_dir .. 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
}
