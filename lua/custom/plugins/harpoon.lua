-- Complete working configuration for Harpoon 2
local vim = vim

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    -- Require Harpoon
    local harpoon = require("harpoon")

    -- REQUIRED: Setup Harpoon
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      }
    })
    
    -- Setup Telescope integration
    local conf = require("telescope.config").values
    local function toggle_telescope()
      -- Get all marked files
      local marks = harpoon:list()
      local items = {}
      
      -- Add nil check to prevent errors if no marks exist
      local mark_items = marks:get() or {}
      for _, item in ipairs(mark_items) do
        table.insert(items, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon Marks",
        finder = require("telescope.finders").new_table({
          results = items,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end
    
    -- Navigation through harpoon marks (bracket style, terminal-compatible)
    vim.keymap.set('n', '[h', function()
      harpoon:list():prev()
    end, { silent = true, noremap = true, desc = 'Harpoon: Previous mark' })
    
    vim.keymap.set('n', ']h', function()
      harpoon:list():next()
    end, { silent = true, noremap = true, desc = 'Harpoon: Next mark' })
    
    -- Jump to specific marks (1-9)
    vim.keymap.set('n', '<M-1>', function()
      harpoon:list():select(1)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 1' })
    
    vim.keymap.set('n', '<M-2>', function()
      harpoon:list():select(2)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 2' })
    
    vim.keymap.set('n', '<M-3>', function()
      harpoon:list():select(3)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 3' })
    
    vim.keymap.set('n', '<M-4>', function()
      harpoon:list():select(4)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 4' })
    
    vim.keymap.set('n', '<M-5>', function()
      harpoon:list():select(5)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 5' })
    
    vim.keymap.set('n', '<M-6>', function()
      harpoon:list():select(6)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 6' })
    
    vim.keymap.set('n', '<M-7>', function()
      harpoon:list():select(7)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 7' })
    
    vim.keymap.set('n', '<M-8>', function()
      harpoon:list():select(8)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 8' })
    
    vim.keymap.set('n', '<M-9>', function()
      harpoon:list():select(9)
    end, { silent = true, noremap = true, desc = 'Harpoon: Mark 9' })

    
    -- Add mark at current file
    vim.keymap.set('n', '<A-h>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon: Add mark' })
    
    -- Open Telescope view 
    vim.keymap.set('n', '<A-h>e', function()
      toggle_telescope()
    end, { desc = 'Harpoon: Telescope view' })
    
    -- Open Harpoon's native quick menu
    vim.keymap.set('n', '<A-h>m', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Quick menu' })
  end
}
