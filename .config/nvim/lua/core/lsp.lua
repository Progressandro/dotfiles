local install_root_dir = vim.fn.stdpath('data') .."/mason/bin/" 

vim.lsp.config.typescript = {
  init_options = { hostInfo = 'neovim' },
  cmd = { install_root_dir .. 'typescript-language-server', '--stdio' },
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

vim.lsp.config.lua = {
  cmd = { install_root_dir .. 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
}

vim.lsp.enable({'typescript', 'lua'})


