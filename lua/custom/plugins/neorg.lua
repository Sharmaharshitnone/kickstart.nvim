return {
  -- {
  --   'nvim-neorg/neorg',
  --   dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  --   -- lazy = false, -- Or ft = "norg"
  --   build = ':Neorg sync-parsers', -- This is the new recommended way to install parsers
  --   version = '*', -- Pin to the latest stable release
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ['core.defaults'] = {}, -- Loads all default capabilities
  --         ['core.concealer'] = {}, -- Adds pretty icons to your documents
  --         ['core.dirman'] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = '~/notes',
  --               -- work = "~/work",
  --             },
  --             default_workspace = 'notes',
  --           },
  --         },
  --         -- REMOVED: ["core.integrations.telescope"] = {}, -- THIS LINE IS GONE
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   -- -- ADDED: The new, separate Telescope integration
  --   -- "nvim-neorg/telescope-neorg.nvim",
  --   -- dependencies = { "nvim-telescope/telescope.nvim", "nvim-neorg/neorg" },
  --   -- config = true, -- Loads the default configuration
  --
  --   -- ADDED: The new, separate Telescope integration
  --   'nvim-neorg/neorg-telescope',
  --   dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-neorg/neorg', 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     -- This is the crucial part:
  --     -- Tell telescope to load the neorg extension
  --     require('telescope').load_extension 'neorg'
  --   end,
  -- },
  {
    vim.keymap.set('n', '<leader>ns', function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.expand '~/notes',
      }
    end, { desc = 'Notes Search' }),
  },
  --   vim.keymap.set('n', '<leader>npn', function()
  --     -- Prompt the user for input
  --     vim.ui.input({ prompt = 'New Project Note Name: ' }, function(name)
  --       -- Check if the user entered a name and didn't cancel
  --       if name and name ~= '' then
  --         -- Construct the full path
  --         local path = '~/notes/project/' .. name .. '.norg'
  --         -- Execute the edit command
  --         vim.cmd('edit ' .. path)
  --       end
  --     end)
  --   end, { desc = '[N]ew [P]roject [N]ote' }),
  --
  vim.keymap.set('n', '<leader>nwn', function()
    -- Prompt the user for input
    vim.ui.input({ prompt = 'New work Note Name: ' }, function(name)
      -- Check if the user entered a name and didn't cancel
      if name and name ~= '' then
        -- Construct the full path
        local path = '~/notes/work/' .. name .. '.md'
        -- Execute the edit command
        vim.cmd('edit ' .. path)
      end
    end)
  end, { desc = '[N]ew [W]ork [N]ote' }),

  --[[   },  ]]
}
