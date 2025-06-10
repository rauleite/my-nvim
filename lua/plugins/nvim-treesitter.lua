return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "sh", "yaml" },
    highlight = {
      enable = true,
    }
  }
}
