return {
  -- GitHub Copilot
  {
    'github/copilot.vim',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
  },

  -- Copilot Chat plugin
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      'github/copilot.vim',
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken', -- Only needed on MacOS or Linux
    opts = {
      model = 'claude-3.7-sonnet-thought',
      -- Configuration for the chat window
      window = {
        layout = 'float',
        relative = 'editor',
        width = 0.6,
        height = 0.8,
        border = 'rounded',
        title = 'Copilot Chat',
      },
      -- Smart selection function that tries visual selection first, then falls back to buffer
      selection = function(source)
        return require('CopilotChat.select').visual(source) or require('CopilotChat.select').buffer(source)
      end,
    },
    -- Properly organized keymaps with which-key compatible format
    keys = {
      -- Group leader
      { '<M-/>c', '<cmd>CopilotChat<cr>', desc = 'Copilot Chat', mode = { 'n', 'v' } },

      -- wommands with descriptive names
      { '<M-/>e', '<cmd>CopilotChatExplain<cr>', desc = 'Explain Code' },
      { '<M-/>f', '<cmd>CopilotChatFix<cr>', desc = 'Fix Issues' },
      { '<M-/>t', '<cmd>CopilotChatTests<cr>', desc = 'Generate Tests' },
      { '<M-/>d', '<cmd>CopilotChatDocs<cr>', desc = 'Write Documentation' },
      { '<M-/>o', '<cmd>CopilotChatOptimize<cr>', desc = 'Optimize Code' },
      { '<M-/>r', '<cmd>CopilotChatReview<cr>', desc = 'Code Review' },
      { '<M-/>s', '<cmd>CopilotChatSave<cr>', desc = 'Save/Search' },
    },
  },
}
