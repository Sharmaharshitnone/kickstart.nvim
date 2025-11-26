return {
  {
    'nvim-lua/plenary.nvim', -- Dummy dependency for notes keymaps
    config = function()
      -- Notes keymaps
      vim.keymap.set('n', '<leader>ns', function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.expand '~/notes',
        }
      end, { desc = 'Notes: Search' })

      vim.keymap.set('n', '<leader>npn', function()
        vim.ui.input({ prompt = 'New Project Note Name: ' }, function(name)
          if name and name ~= '' then
            vim.cmd('edit ~/notes/project/' .. name .. '.md')
          end
        end)
      end, { desc = 'Notes: New Project' })

      vim.keymap.set('n', '<leader>nwn', function()
        vim.ui.input({ prompt = 'New Work Note Name: ' }, function(name)
          if name and name ~= '' then
            vim.cmd('edit ~/notes/work/' .. name .. '.md')
          end
        end)
      end, { desc = 'Notes: New Work' })

      vim.keymap.set('n', '<leader>nwp', function()
        vim.ui.input({ prompt = 'New Personal Note Name: ' }, function(name)
          if name and name ~= '' then
            vim.cmd('edit ~/notes/personal/' .. name .. '.md')
          end
        end)
      end, { desc = 'Notes: New Personal' })

      vim.keymap.set('n', '<leader>nwd', function()
        local date = os.date '%Y-%m-%d'
        vim.cmd('edit ~/notes/daily/' .. date .. '.md')
      end, { desc = 'Notes: Work Daily' })

      vim.keymap.set('n', '<leader>ngd', function()
        local date = os.date '%Y-%m-%d'
        vim.cmd('edit ~/gdrive/Notes/daily/' .. date .. '.md')
      end, { desc = 'Notes: GDrive Daily' })

      vim.keymap.set('n', '<leader>nbc', function()
        vim.cmd('edit ~/bot/cp_journey/progress_log.md')
      end, { desc = 'Notes: CP Journey Log' })

      vim.keymap.set('n', '<leader>nd', function()
        local date = os.date '%Y-%m-%d'
        vim.cmd('edit ~/notes/personal/daily/' .. date .. '.md')
      end, { desc = 'Notes: Personal Daily' })
    end,
  },
}
