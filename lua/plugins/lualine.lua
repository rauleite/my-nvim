return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'christopher-francisco/tmux-status.nvim'
  },
  opts = {
    theme = "catppuccin",
    disabled_filetypes = { "neo-tree" },
    extensions = { "neo-tree" }
    -- sections = {
    --   lualine_c = {
    --     -- ...other lualine components
    --     {
    --       require('tmux-status').tmux_windows,
    --       cond = require('tmux-status').show,
    --       padding = { left = 3 },
    --     },
    --   },
    --   lualine_z = {
    --     -- ...other lualine components
    --     {
    --       require('tmux-status').tmux_session,
    --       cond = require('tmux-status').show,
    --       padding = { left = 3 },
    --     },
    --   }
    -- },
  }
}
