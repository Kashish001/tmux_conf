local options = {
  formatters_by_ft = {
    lua = { "stylua" }, -- Lua formatting with Stylua
    css = { "prettier" }, -- CSS formatting with Prettier
    html = { "prettier" }, -- HTML formatting with Prettier
    javascript = { "prettier" }, -- JavaScript formatting with Prettier
    typescript = { "prettier" }, -- TypeScript formatting with Prettier
    python = { "black" }, -- Python formatting with Black
    json = { "prettier" }, -- JSON formatting with Prettier
  },
  format_on_save = function(bufnr)
    -- Disable autoformat on certain filetypes
    local ignore_filetypes = { "cpp" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    return {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    }
  end,
}

return options
