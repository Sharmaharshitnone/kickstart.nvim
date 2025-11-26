-- Conform.nvim for auto-formatting (clang-format, rustfmt, etc.)
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      cpp = { 'clang_format' },
      c = { 'clang_format' },
      rust = { 'rustfmt' },
      python = { 'black' },
      lua = { 'stylua' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      json = { 'prettier' },
      markdown = { 'prettier' },
    },
    
    -- Format on save (disabled by default for CP - manual formatting is better)
    format_on_save = nil,
    
    -- Configure clang-format for CP style
    formatters = {
      clang_format = {
        prepend_args = {
          '--style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 100, AllowShortFunctionsOnASingleLine: Empty}',
        },
      },
    },
  },
  init = function()
    -- If you want format on save, uncomment this:
    -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
