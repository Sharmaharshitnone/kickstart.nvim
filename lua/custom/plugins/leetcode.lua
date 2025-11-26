return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    lang = 'cpp',
    cn = { enabled = false },
    storage = {
      home = vim.fn.expand('~/work/language/Cpp/leetcode'),
      cache = vim.fn.stdpath('cache') .. '/leetcode',
    },
  },
}

