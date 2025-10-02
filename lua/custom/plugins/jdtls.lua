return {
  'mfussenegger/nvim-jdtls',
  ft = { 'java' },
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- This function will be called when the plugin is loaded for Java files
    -- The actual jdtls setup will be handled in ftplugin/java.lua
  end,
}
