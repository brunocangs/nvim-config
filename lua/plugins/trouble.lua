return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>xn", function()
      local trouble = require("trouble")
      trouble.open("workspace_diagnostics")
      trouble.next({ skip_groups = true, jump = true })
    end)
    vim.keymap.set("n", "<leader>xp", function()
      local trouble = require("trouble")
      trouble.open("workspace_diagnostics")
      trouble.previous({ skip_groups = true, jump = true })
    end)
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("workspace_diagnostics") end)
  end
}
