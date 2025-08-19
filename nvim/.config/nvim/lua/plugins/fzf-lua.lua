-- local colors = require("catppuccin.palettes").get_palette()
return {
  "ibhagwan/fzf-lua",
  enabled = false,
  keys = {
    -- GitBranches fzf-lua
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Select a Git Branch" },
    -- Resume previous picker "Fzf-lua"
    { "tr", "<cmd>FzfLua resume<cr>", desc = "Resume previous picker" },
  },
  opts = {
    -- defaults = {
    --   formatter = "path.filename_first",
    -- },
    "border-fused",
    winopts = {
      preview = {
        -- horizontal = "right:40%", -- right|left:size
        layout = "vertical",
      },
    },
    -- fzf_colors = {
    --   true,
    --   ["fg"] = colors.text,
    --   ["bg+"] = colors.surface0, -- Custom color, originally surface0
    --   ["fg+"] = colors.text,
    --   ["hl"] = colors.red,
    --   ["hl+"] = colors.red,
    --   ["spinner"] = colors.rosewater,
    --   ["header"] = colors.mauve, -- Personal preference, originally red
    --   ["info"] = colors.mauve,
    --   ["pointer"] = colors.mauve,
    --   ["marker"] = colors.rosewater,
    --   ["prompt"] = colors.mauve,
    -- },
    files = {
      prompt = "  ",
    },
    git = {
      branches = {
        prompt = "Branch 󰊢 : ",
      },
    },
  },
}
