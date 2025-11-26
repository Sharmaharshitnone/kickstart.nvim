---@file gruvbox.lua
---@brief Configuration for the Gruvbox color scheme
---@see https://github.com/ellisonleao/gruvbox.nvim
return {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  priority = 1000, -- High priority ensures the colorscheme loads before other plugins
  config = function()
    require('gruvbox').setup {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {
        -- Custom color palette - Gruvbox inspired with tweaks
        bright_green = "#b8bb26",
        bright_red = "#fb4934",
        bright_yellow = "#fabd2f",
        bright_blue = "#83a598",
        bright_purple = "#d3869b",
        bright_aqua = "#8ec07c",
        bright_orange = "#fe8019",
      },
      overrides = {
        -- Main editor background - set to none for transparency
        Normal = { bg = "" },
        NormalFloat = { bg = "" },

        -- Line numbers with custom Gruvbox colors
        LineNr = { fg = "#7c6f64", bg = "" },
        CursorLineNr = { fg = "#fabd2f", bold = true, bg = "" },
        CursorLine = { bg = "#3c3836" },

        -- Sign column (for git signs, diagnostics, etc.)
        SignColumn = { bg = "" },

        -- Which-key styling with Gruvbox palette
        WhichKey = { fg = "#d3869b", bold = true },
        WhichKeyDesc = { fg = "#8ec07c" },
        WhichKeyGroup = { fg = "#83a598" },
        WhichKeyFloat = { bg = "" },
        WhichKeyBorder = { fg = "#7c6f64", bg = "" },
        WhichKeySeparator = { fg = "#665c54" },

        -- Neo-tree styling
        NeoTreeNormal = { bg = "" },
        NeoTreeNormalNC = { bg = "" },
        NeoTreeWinSeparator = { fg = "#7c6f64", bg = "" },
        NeoTreeEndOfBuffer = { bg = "" },
        NeoTreeRootName = { fg = "#fabd2f", bold = true },
        NeoTreeDirectoryName = { fg = "#83a598" },
        NeoTreeDirectoryIcon = { fg = "#83a598" },
        NeoTreeFileNameOpened = { fg = "#fe8019" },
        NeoTreeGitModified = { fg = "#fabd2f" },
        NeoTreeGitAdded = { fg = "#b8bb26" },
        NeoTreeGitDeleted = { fg = "#fb4934" },

        -- Telescope styling
        TelescopeNormal = { bg = "" },
        TelescopeBorder = { fg = "#7c6f64", bg = "" },
        TelescopePromptNormal = { bg = "" },
        TelescopePromptBorder = { fg = "#fe8019", bg = "" },
        TelescopePromptTitle = { fg = "#fe8019", bold = true },
        TelescopeResultsNormal = { bg = "" },
        TelescopeResultsBorder = { fg = "#7c6f64", bg = "" },
        TelescopeResultsTitle = { fg = "#8ec07c", bold = true },
        TelescopePreviewNormal = { bg = "" },
        TelescopePreviewBorder = { fg = "#7c6f64", bg = "" },
        TelescopePreviewTitle = { fg = "#83a598", bold = true },
        TelescopeSelection = { bg = "#3c3836", fg = "#fabd2f", bold = true },
        TelescopeMatching = { fg = "#fe8019", bold = true },

        -- Status line
        StatusLine = { bg = "", fg = "#ebdbb2" },
        StatusLineNC = { bg = "", fg = "#7c6f64" },

        -- Completion menu (Pmenu)
        Pmenu = { bg = "#3c3836", fg = "#ebdbb2" },
        PmenuSel = { bg = "#504945", fg = "#fabd2f", bold = true },
        PmenuSbar = { bg = "#504945" },
        PmenuThumb = { bg = "#7c6f64" },
        PmenuBorder = { fg = "#7c6f64", bg = "#3c3836" },

        -- Float windows
        FloatBorder = { fg = "#7c6f64", bg = "" },
        FloatTitle = { fg = "#fabd2f", bold = true, bg = "" },

        -- LSP related highlights
        DiagnosticError = { fg = "#fb4934" },
        DiagnosticWarn = { fg = "#fabd2f" },
        DiagnosticInfo = { fg = "#83a598" },
        DiagnosticHint = { fg = "#8ec07c" },

        DiagnosticSignError = { fg = "#fb4934", bg = "" },
        DiagnosticSignWarn = { fg = "#fabd2f", bg = "" },
        DiagnosticSignInfo = { fg = "#83a598", bg = "" },
        DiagnosticSignHint = { fg = "#8ec07c", bg = "" },

        -- Git signs
        GitSignsAdd = { fg = "#b8bb26", bg = "" },
        GitSignsChange = { fg = "#fabd2f", bg = "" },
        GitSignsDelete = { fg = "#fb4934", bg = "" },

        -- Treesitter highlights
        ["@variable"] = { fg = "#ebdbb2" },
        ["@function"] = { fg = "#b8bb26", bold = true },
        ["@function.builtin"] = { fg = "#fe8019" },
        ["@keyword"] = { fg = "#fb4934", bold = true },
        ["@keyword.function"] = { fg = "#fb4934", bold = true },
        ["@keyword.return"] = { fg = "#fb4934", bold = true },
        ["@string"] = { fg = "#b8bb26" },
        ["@number"] = { fg = "#d3869b" },
        ["@boolean"] = { fg = "#d3869b" },
        ["@comment"] = { fg = "#928374", italic = true },
        ["@type"] = { fg = "#fabd2f" },
        ["@type.builtin"] = { fg = "#fabd2f" },
        ["@parameter"] = { fg = "#83a598" },
        ["@property"] = { fg = "#83a598" },
        ["@constant"] = { fg = "#d3869b", bold = true },

        -- LSP semantic tokens
        ["@lsp.type.method"] = { fg = "#b8bb26", bold = true },
        ["@lsp.type.function"] = { fg = "#b8bb26", bold = true },
        ["@lsp.type.class"] = { fg = "#fabd2f" },
        ["@lsp.type.namespace"] = { fg = "#83a598" },
        ["@lsp.type.parameter"] = { fg = "#83a598" },
        ["@lsp.type.variable"] = { fg = "#ebdbb2" },

        -- Dashboard/Alpha
        DashboardHeader = { fg = "#fe8019", bold = true },
        DashboardCenter = { fg = "#83a598" },
        DashboardFooter = { fg = "#928374", italic = true },

        -- Mini.nvim specific
        MiniStatuslineModeNormal = { bg = "#83a598", fg = "#282828", bold = true },
        MiniStatuslineModeInsert = { bg = "#b8bb26", fg = "#282828", bold = true },
        MiniStatuslineModeVisual = { bg = "#fe8019", fg = "#282828", bold = true },
        MiniStatuslineModeReplace = { bg = "#fb4934", fg = "#282828", bold = true },
        MiniStatuslineModeCommand = { bg = "#fabd2f", fg = "#282828", bold = true },

        -- Indent guides
        IblIndent = { fg = "#3c3836" },
        IblScope = { fg = "#7c6f64" },

        -- Fold
        Folded = { bg = "#3c3836", fg = "#928374" },
        FoldColumn = { bg = "", fg = "#7c6f64" },

        -- Lazy.nvim
        LazyH1 = { bg = "#fe8019", fg = "#282828", bold = true },
        LazyButton = { bg = "#3c3836", fg = "#ebdbb2" },
        LazyButtonActive = { bg = "#504945", fg = "#fabd2f", bold = true },
        LazySpecial = { fg = "#83a598" },
        LazyReasonPlugin = { fg = "#fb4934" },
        LazyReasonRuntime = { fg = "#d3869b" },

        -- End of buffer
        EndOfBuffer = { fg = "#282828" },
      },
      transparent_mode = true,
      dim_inactive = false,
    }

    -- Set the colorscheme
    vim.cmd.colorscheme 'gruvbox'

    -- Set background to dark
    vim.o.background = 'dark'

    -- Additional transparency overrides (applied after theme loads)
    vim.schedule(function()
      local set_transparent = function(hl)
        local ok, current = pcall(vim.api.nvim_get_hl, 0, { name = hl, link = false })
        if ok then
          current.bg = nil
          vim.api.nvim_set_hl(0, hl, current)
        end
      end

      -- Apply transparency to core UI elements
      set_transparent('Normal')
      set_transparent('NormalFloat')
      set_transparent('SignColumn')
      set_transparent('NeoTreeNormal')
      set_transparent('NeoTreeNormalNC')
      set_transparent('NeoTreeEndOfBuffer')
      set_transparent('TelescopeNormal')
      set_transparent('TelescopePromptNormal')
      set_transparent('TelescopeResultsNormal')
      set_transparent('TelescopePreviewNormal')
      set_transparent('WhichKeyFloat')
      set_transparent('FloatBorder')
      set_transparent('FloatTitle')
      set_transparent('StatusLine')
      set_transparent('StatusLineNC')
      set_transparent('LineNr')
      set_transparent('CursorLineNr')
      set_transparent('FoldColumn')
    end)
  end,
}
