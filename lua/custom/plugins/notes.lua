return {
  {
    vim.keymap.set('n', '<leader>ns', function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.expand '~/notes',
      }
    end, { desc = 'Notes Search' }),
  },
  vim.keymap.set('n', '<leader>npn', function()
    -- Prompt the user for input
    vim.ui.input({ prompt = 'New Project Note Name: ' }, function(name)
      -- Check if the user entered a name and didn't cancel
      if name and name ~= '' then
        -- Construct the full path
        local path = '~/notes/project/' .. name .. '.md'
        -- Execute the edit command
        vim.cmd('edit ' .. path)
      end
    end)
  end, { desc = '[N]ew [P]roject [N]ote' }),
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

  vim.keymap.set('n', '<leader>nwp', function()
    -- Prompt the user for input
    vim.ui.input({ prompt = 'New Personal Note Name: ' }, function(name)
      -- Check if the user entered a name and didn't cancel
      if name and name ~= '' then
        -- Construct the full path
        local path = '~/notes/personal/' .. name .. '.md'
        -- Execute the edit command
        vim.cmd('edit ' .. path)
      end
    end)
  end, { desc = '[N]ew [P]ersonal [N]ote' }),

  vim.keymap.set('n', '<leader>nwd', function()
    -- Get today's date in YYYY-MM-DD format
    local date = os.date '%Y-%m-%d'
    -- Construct the full path
    local path = '~/notes/daily/' .. date .. '.md'
    -- Open the daily note
    vim.cmd('edit ' .. path)
  end, { desc = '[N]ew [W]ork [D]aily note' }),
}
