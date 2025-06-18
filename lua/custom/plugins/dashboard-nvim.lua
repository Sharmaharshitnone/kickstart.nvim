return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter', -- Lazy-load on startup
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = ' Files', group = '@property', action = 'Telescope find_files', key = 'f' },
          { desc = ' Apps', group = 'Label', action = 'Telescope app', key = 'a' },
          { desc = ' Search', group = 'DiagnosticHint', action = 'Telescope live_grep', key = 's' },
        },
        packages = { enable = true }, -- Show plugin stats
        project = { limit = 8, action = 'Telescope find_files cwd=' },
        footer = { '', 'Neovim: The editor of the future' },
      },
    }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
