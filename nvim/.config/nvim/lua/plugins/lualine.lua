-- local function emoji()
--   return "😄"
-- end
-- local filename = {
--   {
--     "filename",
--     color = { bg = "#cba6f7", fg = "#11111b", gui = "bold" },
--     separator = { left = "", right = "" },
--   },
-- }
local rose = require("rose-pine.palette")
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    --remove the last item in the table
    table.remove(opts.sections.lualine_c)
    -- remove second last item in the table
    table.remove(opts.sections.lualine_c)

    -- Only filename
    table.insert(opts.sections.lualine_c, {
      function()
        local filename = vim.fn.expand("%:t")
        if filename == "" then
          return ""
        else
          return filename
        end
      end,
      color = function()
        if vim.bo.modified then
          -- for catppuccin mocha
          -- return { bg = "#fab387", fg = "#11111b", gui = "bold" }
          return { bg = rose.rose, fg = "#11111b", gui = "bold" }
        else
          -- for catppuccin mocha
          -- return { bg = "#74c7ec", fg = "#11111b", gui = "bold" }
          -- for rose-pine default
          return { bg = rose.foam, fg = "#11111b", gui = "bold" }
        end
      end,
      separator = { left = "", right = "" },
    })

    --another option
    -- table.insert(opts.sections.lualine_c, {
    --   LazyVim.lualine.pretty_path(),
    --   color = { bg = "#313244", fg = "#cdd6f4", gui = "bold" },
    --   separator = { left = "", right = "" },
    -- })
  end,
}
