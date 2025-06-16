return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "catppuccin/nvim", -- Certifique-se de que o tema está listado como dependência
    -- 'christopher-francisco/tmux-status.nvim'
  },

  config = function()
    local custom_catppuccin = require("lualine.themes.catppuccin")
    custom_catppuccin.insert.a = {
      bg = "#AAFF00",
      fg = "#023020",
      gui = "bold"
    } -- Escolha a cor desejada
    -- custom_catppuccin.insert.a.bg = "none" -- Escolha a cor desejada

    require("lualine").setup({
      -- theme = "catppuccin",
      options = {
        theme = custom_catppuccin,
        extensions = { "neo-tree" },
      }
      -- disabled_filetypes = { "neo-tree" },
    })
  end,
  -- opts = {
  --   theme = "catppuccin",
  --   -- disabled_filetypes = { "neo-tree" },
  --   extensions = { "neo-tree" },
  -- }
}
