local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = bufnr, async = true })
        vim.cmd.update()
      end, { buffer = bufnr, desc = "[lsp] format", silent = true, noremap = true })
    end
  end,
})
