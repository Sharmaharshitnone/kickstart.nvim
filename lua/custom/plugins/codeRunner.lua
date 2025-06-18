return {
  { 'CRAG666/code_runner.nvim', config = true },
  vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false }),
  vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false }),
}
