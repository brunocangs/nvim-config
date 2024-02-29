
return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function ()
    require'treesitter-context'.setup{
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      max_lines = 6, -- How many lines the window should span. Values <= 0 mean no limit.
      -- min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 3, -- Maximum number of lines to show for a single context
    }
  end
}
