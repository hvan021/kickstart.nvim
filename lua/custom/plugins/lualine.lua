local location = { "location", padding = 0, }
-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "shiftw: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
  'nvim-lualine/lualine.nvim',

  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        -- theme = "onedark",
        theme = "kanagawa",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "Neotree" },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", fmt = function(str) return str:sub(1, 2) end, }, "tab" },
        -- lualine_a = { { "mode", fmt = function(str) return "-" .. str:sub(1, 2) .. "-" end, }, "tab" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "buffers",
            show_filename_only = true,          -- Shows shortened relative path when set to false.
            hide_filename_extension = true,     -- Hide filename extension when set to true.
            show_modified_status = true,        -- Shows indicator when the buffer is modified.
            mode = 4,
            max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
            filetype_names = {
              TelescopePrompt = "Telescope",
              fzf = "FZF",
              -- alpha = "Alpha",
              -- Neotree = "Neotree",
            },
            use_mode_colors = true,
            buffers_color = {
              inactive = "lualine_a_inactive", -- Color for active buffer.
              active = "lualine_a_normal",     -- Color for inactive buffer.
            },
            symbols = {
              modified = " ●", -- Text to show when the buffer is modified
              alternate_file = "#", -- Text to show to identify the alternate file
              directory = "", -- Text to show when the buffer is a directory
            },
          },
        },
        --lualine_x = { wpm.wpm, wpm.historic_graph, "encoding", "fileformat", "filetype" },
        lualine_x = { "diff", spaces, "encoding", "filetype" },
        lualine_y = { "diagnostics" },
        lualine_z = { location, progress },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      -- extensions = { "neo-tree" },
    }
  end
}
