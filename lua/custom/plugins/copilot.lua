return {
  -- GitHub Copilot
  {
    'github/copilot.vim',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    config = function()
      -- disable copilot's default Tab mapping
      vim.g.copilot_no_tab_map = true
      -- Map Tab: when popup menu visible, use completion next; otherwise accept Copilot suggestion
      vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : copilot#Accept("\\<CR>")', { expr = true, noremap = true, silent = true })
    end,
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
      model = 'gpt-5-mini',
      --[[     model = 'claude-3.7-sonnet-thought', ]]
      -- Configuration for the chat window
      window = {
        layout = 'vertical', -- Change to vertical split for side window
        position = 'right', -- Position on the right side (change to 'left' for left side)
        -- width = 40, -- Fixed width in characters (adjust as needed)
        -- height = 0.8,
        border = 'rounded',
        title = 'Copilot Chat',
      },
      -- Smart selection function that tries visual selection first, then falls back to buffer
      selection = function(source)
        return require('CopilotChat.select').visual(source) or require('CopilotChat.select').buffer(source)
      end,
      prompts = {
        Question = {
          prompt = [[  
$selection
1. **Question Breakdown** - Explain the problem in simple terms:
   - Restate the question using everyday language
   - Provide at least 2 clear examples with inputs and outputs
   - List all constraints and special conditions

2. **Visual Explanation**:
   - Use terminal-friendly ASCII diagrams when possible
   - Present visual examples using plain text formatting
   - Break down the solution process in numbered steps

3. **Simple First Approach**:
   - Explain the most straightforward solution first (even if not optimal)
   - Use plain English to describe the logic before showing code
   - Write clean C++ code in /home/kali/work/language/Cpp/dojo-questions/ with fast- before the name and with:
     - Simple variable names that make sense
     - Comments for EVERY major step (written like you're explaining to a friend)
     - Explanations for any tricky parts or coding shortcuts
     - Handling of edge cases (empty arrays, negative numbers, etc.)
   - Show time complexity with real-world analogies (e.g., "With 10× more data, this takes 10× longer")
   - Explain why the approach has its specific time complexity (O(n), O(n²), etc.)

4. **Best Solution**:
   - Build up to the optimal solution step-by-step
   - Explain your thinking process and why this approach works
   - Analyze time and space complexity with concrete examples
   - Write clean C++ code in /home/kali/work/language/Cpp/dojo-questions/ with:
     - Simple variable names that make sense
     - Comments for EVERY major step (written like you're explaining to a friend)
     - Explanations for any tricky parts or coding shortcuts
     - Handling of edge cases (empty arrays, negative numbers, etc.)
     - Explain why the approach has its specific time complexity (O(n), O(n²), etc.)
]],
          command = 'CopilotChatQuestion',
        },
        AddTests = {
          prompt = "Write unit tests for the following code in the file '$filename'. Please use the prevalent testing framework and style. Here is the code:\n\n$selection",
          command = 'CopilotChatTests',
        },
      },
    },
    -- Properly organized keymaps with which-key compatible format
    keys = {
      -- Group leader
      { '<M-/>c', '<cmd>CopilotChat<cr>', desc = 'Copilot Chat', mode = { 'n', 'v' } },
      { '<M-/>q', '<cmd>CopilotChatQuestion<cr>', desc = 'Copilot Chat', mode = { 'n', 'v' } },

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
