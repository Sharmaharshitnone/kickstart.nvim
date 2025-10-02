local config = {
  name = 'jdtls',

  -- `cmd` defines the executable to launch eclipse.jdt.ls.
  -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
  --
  -- As alternative you could also avoid the `jdtls` wrapper and launch
  -- eclipse.jdt.ls via the `java` executable
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },

  -- `root_dir` must point to the root of your project.
  -- See `:help vim.fs.root`
  root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options

  -- This sets the `initializationOptions` sent to the language server
  -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
  -- you'll need to set the `bundles`
  --
  -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
}

-- Use protected call to require jdtls
local ok, jdtls = pcall(require, 'jdtls')
if not ok then
  vim.notify('nvim-jdtls not found! Please install it with :Lazy sync', vim.log.levels.ERROR)
  return
end

-- Check if jdtls executable exists
local jdtls_cmd = vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls')
if vim.fn.executable(jdtls_cmd) == 0 then
  vim.notify('jdtls executable not found at: ' .. jdtls_cmd .. '\nPlease install it with :MasonInstall jdtls', vim.log.levels.ERROR)
  return
end

jdtls.start_or_attach(config)
