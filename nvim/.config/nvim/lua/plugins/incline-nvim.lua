return {
  "b0o/incline.nvim",
  -- dependencies = { "Mofiqul/dracula.nvim" },
  enabled = false,
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local helpers = require("incline.helpers")
    -- local colors = require("dracula").colors()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = "#BD93F9", guifg = "#F8F8F2" },
          InclineNormalNC = { guibg = "#44406e", guifg = "#191a21" },
        },
      },
      -- window = { margin = { vertical = 0, horizontal = 1 } },
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      hide = {
        cursorline = true,
      },
      render = function(props)
        -- local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        -- if vim.bo[props.buf].modified then
        --   filename = "[+]" .. filename
        -- end
        --
        -- local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        -- return { { icon, guifg = color }, { "  " }, { filename } }
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        local buffer = {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          -- guibg = "#44406e",
        }
        return buffer
      end,
    })
  end,
}
