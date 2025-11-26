-- DAP configuration for C++ debugging (codelldb)
return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require('dap')
    
    -- Configure C++ adapter (codelldb)
    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.fn.stdpath('data') .. '/mason/bin/codelldb',
        args = { '--port', '${port}' },
      },
    }
    
    -- C++ debug configurations
    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          -- Default to the compiled binary with same name as source
          local default = vim.fn.expand('%:p:r')
          return vim.fn.input('Path to executable: ', default, 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
      {
        name = 'Launch with stdin from file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          local default = vim.fn.expand('%:p:r')
          return vim.fn.input('Path to executable: ', default, 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = function()
          local input_file = vim.fn.input('Input file: ', 'input.txt', 'file')
          return { '<', input_file }
        end,
        runInTerminal = false,
      },
    }
    
    -- Same config for C
    dap.configurations.c = dap.configurations.cpp
    
    -- Additional keybindings for CP debugging
    vim.keymap.set('n', '<leader>db', function()
      require('dap').toggle_breakpoint()
    end, { desc = 'Debug: Toggle breakpoint' })
    
    vim.keymap.set('n', '<leader>dc', function()
      require('dap').continue()
    end, { desc = 'Debug: Continue' })
    
    vim.keymap.set('n', '<leader>di', function()
      require('dap').step_into()
    end, { desc = 'Debug: Step into' })
    
    vim.keymap.set('n', '<leader>do', function()
      require('dap').step_over()
    end, { desc = 'Debug: Step over' })
  end,
}
