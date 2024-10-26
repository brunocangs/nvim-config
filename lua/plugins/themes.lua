return {
  -- { "catppuccin/nvim",              name = "catppuccin", priority = 1000 },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup({
  --       styles = {
  --         italic = false
  --       }
  --       -- variant = "moon"
  --     })
  --   end
  -- },
  -- { "miikanissi/modus-themes.nvim", priority = 1000 },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })

      vim.cmd('colorscheme github_dark_default')
    end,
  }
}
