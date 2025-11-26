return {
  'mrcjkb/rustaceanvim',
  version = '^6',
  ft = 'rust', -- Lazy-load on Rust files only
  opts = {
    tools = {
      hover_actions = { auto_focus = true },
      inlay_hints = {
        auto = true,
        show_parameter_hints = true,
      },
    },
    server = {
      on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Action' }))
        vim.keymap.set('n', '<leader>rr', ':RustLsp runnables<CR>', vim.tbl_extend('force', opts, { desc = 'Rust: Runnables' }))
        vim.keymap.set('n', '<leader>rd', ':RustLsp debuggables<CR>', vim.tbl_extend('force', opts, { desc = 'Rust: Debuggables' }))
        vim.keymap.set('n', '<leader>rt', ':RustLsp testables<CR>', vim.tbl_extend('force', opts, { desc = 'Rust: Testables' }))
        vim.keymap.set('n', '<leader>re', ':RustLsp explainError<CR>', vim.tbl_extend('force', opts, { desc = 'Rust: Explain error' }))
      end,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            buildScripts = { enable = true },
          },
          checkOnSave = {
            command = 'clippy',
            extraArgs = { '--', '-W', 'clippy::all' },
          },
          inlayHints = {
            lifetimeElisionHints = { enable = 'always' },
            bindingModeHints = { enable = true },
            chainingHints = { enable = true },
            closingBraceHints = { minLines = 10 },
          },
          procMacro = { enable = true },
        },
      },
    },
  },
}
