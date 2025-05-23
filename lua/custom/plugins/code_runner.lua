-- Code Runner configuration
-- https://github.com/CRAG666/code_runner.nvim

return {
  "CRAG666/code_runner.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("code_runner").setup({
      -- Choose default mode (valid term, tab, float, toggle, buf)
      mode = "float",
      
      -- Focus on runner window (only works on toggle, term and tab mode)
      focus = true,
      
      -- Start runner when run key is pressed
      startinsert = true,
      
      -- Set to true if you want to close the terminal window after process exit
      term = {
        position = "bot",
        size = 12,
      },
      
      float = {
        -- Window border (see ':h nvim_open_win')
        border = "rounded",
        
        -- Num from `0 - 1` for measurements
        height = 0.7,
        width = 0.7,
        x = 0.5,
        y = 0.5,
        
        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",
        
        -- Close the terminal window after process exit
        close_on_exit = true,
      },
      
      -- Language-specific commands to run
      filetype = {
        python = "python3 -u $fileName",
        javascript = "node $fileName",
        typescript = "ts-node $fileName",
        rust = "cargo run",
        go = "go run $fileName",
        cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        c = "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        sh = "bash $fileName",
        lua = "lua $fileName",
        php = "php $fileName",
        ruby = "ruby $fileName",
        perl = "perl $fileName",
        r = "Rscript $fileName",
        dart = "dart $fileName",
        julia = "julia $fileName",
        kotlin = "kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
        swift = "swift $fileName",
        haskell = "runhaskell $fileName",
        lisp = "clisp $fileName",
        elixir = "elixir $fileName",
        matlab = "matlab -nodisplay -nosplash -nodesktop -r \"run('$fileName');exit;\"",
      },
      
      -- Set to true to enable project-specific configuration
      project = {
        -- name of the project marker file, defaults to '.projectile'
        name = ".projectile",
        
        -- Patterns to identify project type
        patterns = {
          -- NodeJS
          ["package.json"] = {
            command = "npm start",
            name = "npm project",
          },
          
          -- Cargo (Rust)
          ["Cargo.toml"] = {
            command = "cargo run",
            name = "cargo project",
          },
          
          -- Maven (Java)
          ["pom.xml"] = {
            command = "mvn compile exec:java",
            name = "maven project",
          },
          
          -- Make project
          ["Makefile"] = {
            command = "make",
            name = "make project",
          },
          
          -- Go project
          ["go.mod"] = {
            command = "go run .",
            name = "go project",
          },
        },
      },
    })
    
    -- Set up keymaps
    vim.keymap.set("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = true, desc = "Run code" })
    vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = true, desc = "Run current file" })
    vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = true, desc = "Run project" })
    vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = true, desc = "Close runner" })
    vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = true, desc = "Run custom command for filetype" })
    vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = true, desc = "Run custom command for project" })
    
    -- Execute before running
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {"python", "javascript", "typescript", "rust", "go", "cpp", "c", "java", "sh", "lua"},
      callback = function()
        -- Save file before running
        vim.keymap.set("n", "<leader>r", ":w<CR>:RunCode<CR>", { noremap = true, silent = true, buffer = true, desc = "Save and run code" })
        vim.keymap.set("n", "<leader>rf", ":w<CR>:RunFile<CR>", { noremap = true, silent = true, buffer = true, desc = "Save and run file" })
      end,
    })
  end,
}
