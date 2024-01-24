return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>xn", function()
      local trouble = require("trouble")
      if trouble.is_open() then
        trouble.next({ skip_groups = true, jump = true })
      else
        trouble.open("workspace_diagnostics")
      end
    end)
    vim.keymap.set("n", "<leader>xp", function()
      local trouble = require("trouble")
      if trouble.is_open() then
        trouble.previous({ skip_groups = true, jump = true })
      else
        trouble.open("workspace_diagnostics")
      end
    end)
    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle("workspace_diagnostics") end)
  end
}
