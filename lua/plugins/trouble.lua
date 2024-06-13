return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    warn_no_results = false,
    open_no_results = true,
    modes = {
      lsp_document_symbols = { win = { position = "left" } },
      diagnostics = {
        preview = {
          type = "split",
          relative = "editor",
          position = "left",
          size = 0.4,
        }
      }
    }
  },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>",              desc = "Show workspace errors" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>",                                                            desc = "Show workspace full diagnostics" },
    { "<leader>ds", "<cmd>Trouble lsp_document_symbols toggle pinned=true results.win.relative=win results.win.position=left<cr>", desc = "Toggle document symbols" },
      {
        "<leader>xn",
        "<cmd>Trouble next skip_groups=true jump=true<cr>",
      },
      {
        "<leader>xp",
        "<cmd>Trouble prev skip_groups=true jump=true<cr>",
      }
  }
}
