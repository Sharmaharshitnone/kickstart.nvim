-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true, -- Close Neo-tree if it is the last window
    popup_border_style = "rounded",
    window = {
      position = "left", -- "left", "right", "float"
      width = 30, -- Adjust width
      mapping_options = {
        noremap = true,
        nowait = true,
      },
      mappings = {
        ["<CR>"] = "open",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "split_with_window_picker",
        ["<c-v>"] = "vsplit_with_window_picker",
        ["<c-t>"] = "open_tabnew",
        ["o"] = "open",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy", -- Copy full path
        ["m"] = "move",
        ["q"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<"] = "prev_source",
        [">"] = "next_source",
        ["S"] = "open_split", -- Default split command
        -- Your existing mapping:
        ['\\'] = 'close_window',
      },
    },
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered items in a collapsed state
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_hidden = true, -- Respect user's hidden files settings
        hide_by_name = {
          -- '.git',
          -- 'node_modules'
        },
        never_show = { -- Remains hidden even if visible is true
          -- '.DS_Store',
          -- 'thumbs.db'
        },
      },
      follow_current_file = {
        enabled = true, -- Neo-tree will automatically follow the current file
        leave_dirs_open = false,
      },
      use_libuv_file_watcher = true, -- Enable file watcher for automatic updates
      group_empty_dirs = true, -- Group empty directories when sorting
      hijack_netrw_behavior = "open_current", -- Or "open_default", "disabled"
    },
    sources = { "filesystem", "buffers", "git_status" }, -- Add sources you want
    source_selector = {
      winbar = true, -- Show source selector in winbar
      statusline = true, -- Show source selector in statusline
      content_layout = "center",
      tabs_layout = "equal",
      show_icons = "always", -- "always", "never", "if_active"
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1, -- Padding between left-edge of window and indent guides
        -- indent_marker = "│",
        -- last_indent_marker = "└",
        -- highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
        -- The next two settings are only a fallback, if you find icons missing
        -- then you will need to install nvim-web-devicons and configure it.
        -- You can also set them to "" if you want to disable the icons completely
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- or "✖", but this is redundant info if you use git_status_colors on the name
          renamed   = "󰁕",-- or "󰁕", but this is redundant info if you use git_status_colors on the name
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      }
    }
  },
}
