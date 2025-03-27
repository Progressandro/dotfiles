vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Show diagnostics on hover
    vim.api.nvim_create_autocmd({ "CursorHold" }, {
      callback = function()
        vim.diagnostic.open_float({
          scope = 'line',
          focus = false,
        })
      end,
    })
  end,
})

vim.lsp.enable({ 'typescript', 'lua', 'eslint' })
