---@file catppuccin.lua
---@brief Configuration for the Catppuccin color scheme
---@see https://github.com/catppuccin/nvim
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- High priority ensures the colorscheme loads before other plugins
  config = function()
    require('catppuccin').setup {
      integrations = {
        -- Enable integration with various plugins
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        markdown = true,
        dashboard = true,
        treesitter = true,
        copilot_vim = true,
        -- notify = false,

        -- Mini.nvim plugin integration
        mini = {
          enabled = true,
          indentscope_color = 'lavender', -- Custom color for indent guides
        },

        -- Telescope integration with custom styling
        telescope = {
          enabled = true,
          style = 'nvchad', -- Uses NvChad's telescope style
        },

        -- Custom completion UI styling
        blink_cmp = {
          style = 'bordered',
          enabled = true,
        },

        -- LSP diagnostic styling configuration
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { 'italic' },
            hints = { 'italic' },
            warnings = { 'italic' },
            information = { 'italic' },
            ok = { 'italic' },
          },
          underlines = {
            errors = { 'underline' },
            hints = { 'underline' },
            warnings = { 'underline' },
            information = { 'underline' },
            ok = { 'underline' },
          },
          inlay_hints = {
            background = true, -- Add background to inlay hints
          },
        },
      },
    }
    -- Set the colorscheme
    vim.cmd.colorscheme 'catppuccin-mocha' -- Apply the mocha flavor of catppuccin
  end,
}
