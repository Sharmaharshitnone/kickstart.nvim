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
      -- NOTE: C++ debugger (codelldb) configured in lua/custom/plugins/dap-cpp.lua
      ensure_installed = {
        'delve', -- For Go
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

    -- GO Configuration
    require('dap-go').setup()

    -- NOTE: C++ debugger configuration moved to lua/custom/plugins/dap-cpp.lua
    --       Using codelldb instead of cpptools for better performance

  end,
}
