return {
  {
    'nvim-lua/plenary.nvim',
    config = function()
      -- Smart window split function
      local function smart_split_and_find()
        local width = vim.api.nvim_win_get_width(0)
        local height = vim.api.nvim_win_get_height(0)

        if width > height * 1.5 then
          -- Window is wide, split vertically
          vim.cmd 'vsplit'
        else
          -- Window is tall or square-ish, split horizontally
          vim.cmd 'split'
        end

        -- Open telescope to select a file
        require('telescope.builtin').find_files()
      end

      vim.keymap.set('n', '<leader>o', smart_split_and_find, { desc = 'Smart split and find file' })
      
      -- Set Telescope transparency highlights
      vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
