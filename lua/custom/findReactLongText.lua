-- Import necessary modules

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
-- local previewers = require "telescope.previewers"
local parsers = require 'nvim-treesitter.parsers'
local ts_utils = require 'nvim-treesitter.ts_utils'
local utils = require "telescope.utils"
local make_entry = require 'telescope.make_entry'


-- Define a function to find JSX text elements with at least 3 characters
local function find_long_jsx_text(bufnr, opts)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  opts = opts or {}
  -- Check if the JSX parser is available
  if not parsers.has_parser('tsx') then
    vim.print('TSX parser not available')
    return
  end

  -- Get the parser for the current buffer
  local parser = parsers.get_parser(bufnr, 'tsx')

  -- Parse the buffer
  local root = parser:parse()[1]:root()

  local looseStringsQuery = vim.treesitter.query.parse('tsx', [[
((jsx_text) @text (#offset! @text))
]])
  local lines_with_numbers = {}
  local filename = vim.api.nvim_buf_get_name(bufnr)
  -- Find JSX text nodes with at least 3 characters
  for i, match, metadata in looseStringsQuery:iter_matches(root, bufnr) do
    local node = match[1]
    local text = vim.treesitter.get_node_text(node, bufnr)
    if text ~= nil and #text >= 3 then
      -- print("linenumr", metadata[1].range[1])
      table.insert(lines_with_numbers, {
        range = metadata[1].range,
        bufnr = opts.bufnr,
        filename = filename,
        text = text,
      })
    end
  end
  local stringPlaceholders = vim.treesitter.query.parse('tsx', [[
  (jsx_attribute
    (property_identifier) @property (#eq? @property "placeholder")
    (_) @inside (#match? @inside "^[\{]{0,1}[\"`]") (#offset! @inside)
    )
  ]])
  for _, match, metadata in stringPlaceholders:iter_matches(root, bufnr) do
    local textNode = match[2]
    -- vim.print(metadata)
    table.insert(lines_with_numbers, {
      range = metadata[2].range,
      bufnr = opts.bufnr,
      filename = filename,
      text = "Placeholder: " .. vim.treesitter.get_node_text(textNode, bufnr),
    })
  end

  print("Line count", #lines_with_numbers)
  if #lines_with_numbers > 0 then
    pickers.new(opts, {
      -- prompt_title = "Large text",
      finder = finders.new_table {
        results = lines_with_numbers,
        -- sorter = conf.generic_sorter(opts),
        entry_maker = function(entry)
          local newLinePos = string.find(entry.text, "^\n") or -1
          -- Starts with newline
          if newLinePos == 1 then
            vim.print({text = entry.text})
            local offset = string.find(entry.text, "%S")
            return {
              value = entry.text:gsub("^%s+", ""):gsub("%s+$", ""),
              display = function(ent)
                local display = utils.transform_path(opts, ent.filename)
                return display
              end,
              ordinal = 1,
              bufnr = entry.bufnr,
              filename = entry.filename,
              lnum = entry.range[1] + 2,
              col = offset - 1
            }
          else
            return {
              value = entry.text:gsub("^%s+", ""):gsub("%s+$", ""),
              display = function(ent)
                local display = utils.transform_path(opts, ent.filename)
                return display
              end,
              ordinal = 1,
              bufnr = entry.bufnr,
              filename = entry.filename,
              lnum = entry.range[1] + 1,
              col = entry.range[2] + 1
            }
          end
        end,
        sorter = conf.generic_sorter(opts)
        -- previewer = previewers.buffer_previewer(opts)
      }
    }):find()
  end
  -- Use Telescope to display the results
end

-- find_long_jsx_text(25)
return find_long_jsx_text
