-- Sniprun plugin configuration
-- https://github.com/michaelb/sniprun

return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  config = function()
    require("sniprun").setup({
      -- Display the output in a floating window
      display = {
        "Classic",       -- Display stdout in the command line
        "VirtualTextOk", -- Display successful results as virtual text
        "FloatingWindow" -- Display results in a floating window
      },
      -- You can customize display settings for specific filetypes
      display_options = {
        terminal_width = 45,
        notification_duration = 5 -- in seconds
      },
      -- Configure specific languages (optional)
      repl_enable = { 
        "Python3_original", 
        "JS_TS_deno", 
        "Lua_nvim" 
      },
      -- Python interpreter configuration
      interpreter_options = {
        Python3_original = {
          command = "/home/kali/.local/share/pipx/venvs/klepto/bin/python",
        }
      },
      -- Set up keybindings
      -- These will be set up in the config function below
    })

    -- Set keymaps for sniprun
    vim.keymap.set("n", "<leader>Sr", "<Plug>SnipRun", { desc = "Run code snippet" })
    vim.keymap.set("v", "<leader>Sr", "<Plug>SnipRun", { desc = "Run selected code" })
    vim.keymap.set("n", "<leader>Sc", "<Plug>SnipClose", { desc = "Close sniprun output" })
    vim.keymap.set("n", "<leader>SR", "<Plug>SnipReset", { desc = "Reset sniprun" })
    vim.keymap.set("n", "<leader>Si", "<Plug>SnipInfo", { desc = "Sniprun info" })
    vim.keymap.set("n", "<F5>", "<Plug>SnipRunOperator", { desc = "Sniprun operator mode" })
  end,
}
