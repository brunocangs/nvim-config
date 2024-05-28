return {
  "tpope/vim-dadbod",
  {
    "kristijanhusak/vim-dadbod-completion",
    config = function()
      vim.g.db_ui_use_nerd_fonts = true
      vim.keymap.set("n", "<leader>db", function()
        local winnr = -1
        for _, tab in pairs(vim.api.nvim_list_tabpages()) do
          for _, win in pairs(vim.api.nvim_tabpage_list_wins(tab)) do
            local buf = vim.api.nvim_win_get_buf(win)
            if string.match(vim.api.nvim_buf_get_name(buf), "dbui$") then
              winnr = win
            end
          end
        end
        if winnr ~= -1 then
          vim.api.nvim_set_current_win(winnr)
        else
          vim.cmd("tabnew")
          vim.cmd("DBUI")
        end
      end)
    end
  },
  "kristijanhusak/vim-dadbod-ui",
}



-- end
