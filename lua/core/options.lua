--
-- Lazy pre-startup options
--

vim.opt.clipboard = 'unnamedplus' -- Habilita clipboard do sistema
vim.opt.number = true             -- Exibe números de linha
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
-- deixa a linha de comando junto com a de status
-- vim.opt.cmdheight = 0
vim.opt.cmdheight = 1
-- omite os modos (como -- INSERT --)
vim.opt.showmode = false

-- -- aprimorar desempenho na conexão remota
-- vim.opt.lazyredraw = true
-- vim.opt.timeoutlen = 500
-- vim.opt.updatetime = 250

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- INDENTS
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "sh", "dart", "yml" }, -- Adicione outras linguagens conforme necessário
  callback = function()
    local indent = {
      lua = 2,
      sh = 2,
      dart = 2,
      yml = 4,
    }

    local ft = vim.bo.filetype
    if indent[ft] then
      vim.bo.shiftwidth = indent[ft]
      vim.bo.tabstop = indent[ft]
      vim.bo.expandtab = true
      vim.bo.smartindent = true
      vim.bo.autoindent = true
    end
  end,
})

vim.diagnostic.config({
  float = {
    border = "rounded",
    focusable = false,
    -- source = "always",
    format = function(diagnostic)
      return diagnostic.message                                  -- Mantém texto intacto
    end,
    max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.8), -- Define largura automática 80%
    wrap = true                                                  -- Garante que a quebra de linha seja natural
  },
  virtual_text = {
    prefix = "→", -- Ícone antes da mensagem
    spacing = 2, -- Espaço entre o código e o diagnóstico
    severity_sort = true,
    format = function(diagnostic)
      local max_width = math.floor(vim.api.nvim_win_get_width(0) * 0.75) -- 80% da largura da tela
      return string.sub(diagnostic.message, 1, max_width) .. (string.len(diagnostic.message) > max_width and "…" or "")
    end,
  },
  update_in_insert = false -- Melhora performance desativando atualizações durante digitação
})

-- -- Cria um grupo para o autocmd de formatação
local lsp_format_on_save = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = lsp_format_on_save,
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    -- local clients = vim.lsp.get_clients({ bufnr = bufnr })
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in ipairs(clients) do
      if client and client.supports_method and (client:supports_method("textDocument/formatting")) then
        vim.lsp.buf.format({ async = false, bufnr = bufnr })
        break
      end
    end
  end,
})

-- local lspconfig = require("lspconfig")
--
-- -- Configuração global para todos os LSPs
-- local default_config = {
--   flags = {
--     debounce_text_changes = 150, -- Reduz chamadas excessivas ao servidor
--   },
--   capabilities = vim.lsp.protocol.make_client_capabilities(),
-- }
--
-- -- Aplicar a configuração global a todos os servidores LSP
-- for _, server in ipairs(require("lspconfig").util.available_servers()) do
--   lspconfig[server].setup(default_config)
-- end
