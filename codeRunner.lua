return {
  {
    'CRAG666/code_runner.nvim',
    config = function()
      local ok, code_runner = pcall(require, 'code_runner')
      if not ok then
        vim.notify('code_runner.nvim not installed', vim.log.levels.WARN)
        return
      end

      local function find_project_root()
        local names = { 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', 'build.gradle.kts' }
        for _, name in ipairs(names) do
          local p = vim.fn.findfile(name, '.;')
          if p ~= '' then
            return vim.fn.fnamemodify(p, ':p:h')
          end
        end
        return nil
      end

      code_runner.setup({
        mode = 'float',
        focus = true,
        startinsert = false,
        -- make the float a bit taller so short outputs are more visible
        float = { border = 'rounded', width = 0.9, height = 0.8 },
        term = { clean = true, init = 1 },
        -- Ensure the current buffer is saved before running so runners work on latest code
        before_run_filetype = function()
          -- try to write the buffer silently; if it's a new file, this will still write
          pcall(vim.cmd, 'write')
        end,

        filetype = {
          -- Use a function to shell-escape the current file path so paths with spaces work reliably
          python = function()
            local f = vim.fn.expand('%:p')
            return 'python3 -u ' .. vim.fn.shellescape(f)
          end,
          java = function()
            local root = find_project_root()
            if root then
              -- Prefer Gradle wrapper
              if vim.fn.filereadable(root .. '/gradlew') == 1 or vim.fn.executable(root .. '/gradlew') == 1 then
                return 'cd ' .. root .. ' && ./gradlew run'
              end

              -- Prefer maven wrapper if present
              if vim.fn.filereadable(root .. '/mvnw') == 1 or vim.fn.executable(root .. '/mvnw') == 1 then
                return 'cd ' .. root .. ' && ./mvnw -q -DskipTests package && java -jar target/*.jar'
              end

              -- If pom.xml exists, use mvn
              if vim.fn.filereadable(root .. '/pom.xml') == 1 then
                return 'cd ' .. root .. ' && mvn -q -DskipTests package && java -jar target/*.jar'
              end

              -- Fallback to attempting gradle run
              return 'cd ' .. root .. ' && ./gradlew run'
            end

            -- Single-file fallback: compile and run
            return {
              'javac $fileName &&',
              'java -cp $dir $fileNameWithoutExt',
            }
          end,

          typescript = function()
            local cwd = vim.fn.getcwd()
            -- Prefer Deno when a deno.json or deno.jsonc exists
            if vim.fn.filereadable(cwd .. '/deno.json') == 1 or vim.fn.filereadable(cwd .. '/deno.jsonc') == 1 then
              -- Create a small autocmd group to rerun on save for TS files in the project
              local group = vim.api.nvim_create_augroup('CodeRunnerDeno', { clear = true })
              vim.api.nvim_create_autocmd('BufWritePost', {
                group = group,
                pattern = '*.ts',
                callback = function()
                  -- Run the current file with deno
                  vim.cmd('silent! RunCode')
                end,
              })

              return 'deno run --allow-read --allow-net $file'
            end

            -- Prefer tsc then node (more robust)
            if vim.fn.executable('tsc') == 1 and vim.fn.executable('node') == 1 then
              return {
                'tsc $fileName &&',
                'node $dir/$fileNameWithoutExt.js',
              }
            end

            -- Prefer ts-node if available
            if vim.fn.executable('ts-node') == 1 then
              return 'ts-node $file'
            end

            -- Try npx ts-node as a last-resort fallback
            if vim.fn.executable('npx') == 1 then
              return 'npx ts-node $file'
            end

            -- Nothing available; return an informative command that will error
            return 'echo "No TypeScript runner found (install tsc/node or ts-node)"'
          end,

          -- Rust: prefer cargo (project) or rustc (single file)
          rust = function()
            -- Look for Cargo.toml in current dir or ancestors
            local cargo_file = vim.fn.findfile('Cargo.toml', '.;')
            if cargo_file ~= '' then
              local root = vim.fn.fnamemodify(cargo_file, ':p:h')
              return 'cd ' .. root .. ' && cargo run'
            end

            -- Single-file fallback: compile with rustc and run
            return {
              'rustc $fileName -o $dir/$fileNameWithoutExt &&',
              '$dir/$fileNameWithoutExt',
            }
          end,

          -- C++: Competitive Programming optimized (C++23, O3, AVX2)
          cpp = function()
            local f = vim.fn.expand('%:p')
            local exe = vim.fn.expand('%:p:r')
            return {
              'g++ -std=c++23 -O3 -march=native -Wall -Wextra -DLOCAL ' .. vim.fn.shellescape(f) .. ' -o ' .. vim.fn.shellescape(exe) .. ' &&',
              vim.fn.shellescape(exe),
            }
          end,

          -- C: similar to C++ but with C23 standard
          c = function()
            local f = vim.fn.expand('%:p')
            local exe = vim.fn.expand('%:p:r')
            return {
              'gcc -std=c23 -O3 -march=native -Wall -Wextra -DLOCAL ' .. vim.fn.shellescape(f) .. ' -o ' .. vim.fn.shellescape(exe) .. ' &&',
              vim.fn.shellescape(exe),
            }
          end,

          -- Go: prefer go run (project) or go run (single file)
          go = function()
            -- Look for go.mod in current dir or ancestors
            local go_mod = vim.fn.findfile('go.mod', '.;')
            if go_mod ~= '' then
              local root = vim.fn.fnamemodify(go_mod, ':p:h')
              return 'cd ' .. root .. ' && go run .'
            end

            -- Single-file fallback: run the current file
            local f = vim.fn.expand('%:p')
            return 'go run ' .. vim.fn.shellescape(f)
          end,
        },

        focus_on_run = true,
        hot_reload = false,
      })

      -- Keymaps for running code
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>r', ':RunCode<CR>', opts)
      vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', opts)
      vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', opts)
      vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', opts)
      vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', opts)
    end,
  },
}
