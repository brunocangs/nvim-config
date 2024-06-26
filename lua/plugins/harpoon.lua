return {
  "theprimeagen/harpoon",
  config = function()
    require("harpoon").setup()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>m", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<M-h>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<M-b>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<M-j>", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<M-n>", function() ui.nav_file(4) end)
  end
}
