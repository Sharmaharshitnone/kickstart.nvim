---@file catppuccin.lua
---@brief Configuration for the Catppuccin color scheme
---@see https://github.com/catppuccin/nvim
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- High priority ensures the colorscheme loads before other plugins
  config = function()
    require('catppuccin').setup {
      -- Note Harshit you can set them to false if you don't want them
      transparent_background = true,
       term_colors = true,
        color_overrides = {
          mocha = {
            base = '#333333',      -- Main background
            mantle = '#2a2a2a',    -- Darker background
            crust = '#1e1e1e',     -- Darkest background
            surface0 = '#404040',   -- Slightly lighter than base
            surface1 = '#4a4a4a',   -- Even lighter
            surface2 = '#555555',   -- Lightest surface
          },
        },
             custom_highlights = function(colors)
          return {
            -- Main editor background
            Normal = { bg = '#333333' },
            NormalFloat = { bg = '#2a2a2a' },
            
            -- Line numbers with your custom colors
            LineNr = { fg = '#5E81AC' },
            CursorLineNr = { fg = '#C3B9E1', bold = true },
            
            -- Which-key styling
            WhichKey = { fg = '#C3B9E1' },
            WhichKeyDesc = { fg = '#88C0D0' },
            WhichKeyGroup = { fg = '#81A1C1' },
            WhichKeyFloat = { bg = '#2a2a2a' },
            WhichKeyBorder = { fg = '#5E81AC', bg = '#2a2a2a' },
            
            -- Neo-tree styling
            NeoTreeNormal = { bg = '#2a2a2a' },
            NeoTreeNormalNC = { bg = '#2a2a2a' },
            NeoTreeWinSeparator = { fg = '#5E81AC', bg = '#333333' },
            
            -- Telescope styling
            TelescopeNormal = { bg = '#2a2a2a' },
            TelescopeBorder = { fg = '#5E81AC', bg = '#2a2a2a' },
            TelescopePromptNormal = { bg = '#404040' },
            TelescopePromptBorder = { fg = '#5E81AC', bg = '#404040' },
            TelescopeResultsNormal = { bg = '#2a2a2a' },
            TelescopePreviewNormal = { bg = '#2a2a2a' },
            
            -- Status line
            StatusLine = { bg = '#2a2a2a', fg = '#88C0D0' },
            StatusLineNC = { bg = '#1e1e1e', fg = '#4C566A' },
            
            -- Completion menu
            Pmenu = { bg = '#2a2a2a', fg = '#D8DEE9' },
            PmenuSel = { bg = '#5E81AC', fg = '#2E3440' },
            PmenuBorder = { fg = '#5E81AC', bg = '#2a2a2a' },
          }
        end,
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
