-- debug.lua
--
-- Configures nvim-dap for both Go and C++.

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go', -- For Go debugging
  },
  keys = {
    -- Your existing keymaps are good, no changes needed here.
    { '<F5>', function() require('dap').continue() end, desc = 'Debug: Start/Continue' },
    { '<F1>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
    { '<F2>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
    { '<F3>', function() require('dap').step_out() end, desc = 'Debug: Step Out' },
    { '<M-.>', function() require('dap').toggle_breakpoint() end, desc = 'Debug: Toggle Breakpoint' },
    { '<M->>', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Breakpoint' },
    { '<F7>', function() require('dapui').toggle() end, desc = 'Debug: See last session result.' },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- ### 1. SETUP MASON TO INSTALL DEBUG ADAPTERS ###
    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      -- Ensure both Go and C++ debuggers are installed
      ensure_installed = {
        'delve',    -- For Go
        'cpptools', -- For C++
      },
    }

    -- ### 2. SETUP DAP UI ###
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- ### 3. LANGUAGE-SPECIFIC CONFIGURATIONS ###

    -- GO Configuration (your existing setup)
    require('dap-go').setup()

    -- C++ ADAPTER Configuration
    -- This tells dap how to launch the cpptools debug server
    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      options = {
        detached = false,
      },
    }

    -- C++ LAUNCH Configuration
    -- This defines a template for launching and debugging a C++ file
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg", -- Must match the adapter name from above
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'enable pretty printing',
            ignoreFailures = false
          },
        },
      },
    }
    -- Use the same configuration for C files
    dap.configurations.c = dap.configurations.cpp

  end,
}
