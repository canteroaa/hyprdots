local mocha = require("catppuccin.palettes").get_palette("mocha")

-- Neotree highlight
-- vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#403d52" })
-- vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#343b41" })
-- vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#343b41" })
-- vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#343b41" })

return {

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      highlight_groups = {
        -- pa cambiar el background
        -- Normal = { bg = "#000000" },
        -- NormalNC = { bg = "#000000" },
        CursorLine = { bg = "#191724" },
        CursorLineNr = { fg = "#ebbcba" },
      },
    },
  },

  -- {
  --   "Mofiqul/vscode.nvim",
  --   config = function()
  --     local c = require("vscode.colors").get_colors()
  --     require("vscode").setup({
  --       group_overrides = {
  --         CursorLine = { bg = "NONE" },
  --         CursorLineNr = { fg = c.vscBlue },
  --       },
  --     })
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          hl.CursorLine = { bg = "NONE" }
          hl.NeoTreeCursorLine = { bg = "#403d52" }
        end,
        -- on_colors = function(colors)
        --   colors.bg = "#000000"
        -- end,
      })
    end,
  },
  -- {
  --   "RRethy/base16-nvim",
  -- },
  --
  -- SnacksPickerCursorLine = {  }
  -- {
  --   "vague2k/vague.nvim",
  --   config = function()
  --     local vague = {
  --       LspReferenceRead = { bg = "#2C2B3D" },
  --       LspReferenceWrite = { bg = "#2C2B3D" },
  --       LspReferenceText = { bg = "#2C2B3D" },
  --       CursorLine = { bg = "NONE" },
  --       CursorLineNr = { fg = "#e0a363" },
  --       NeoTreeCursorLine = { bg = "#403d52" },
  --       NeoTreeGitUntracked = { fg = "#908caa" },
  --       FlashLabel = { bg = "#df6882" },
  --       NeoTreeWinSeparator = { fg = "#555555", bg = "none" },
  --       SnackSpickerListCursorLine = { bg = "#252530" },
  --     }
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       pattern = "*",
  --       callback = function()
  --         for hl, col in pairs(vague) do
  --           vim.api.nvim_set_hl(0, hl, col)
  --         end
  --       end,
  --     })
  --   end,
  -- },
  --
  -- {
  --   "dgox16/oldworld.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   -- opts = {
  --   --   variant = "oled",
  --   -- },
  -- },

  -- dracula
  -- {
  --   "Mofiqul/dracula.nvim",
  --   config = function()
  --     vim.cmd(":highlight NeogitDiffAddHighlight guifg=#282828 guibg=#23cf76")
  --   end,
  -- },
  --
  -- { "projekt0n/github-nvim-theme" },

  -- Configure LazyVim to load colorscheme

  --[[ tokyonight styles: tokyonight-night, tokyonight-storm, tokyonight-moon
   colorscheme catppuccin -> "catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
   
   --]]
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      custom_highlights = {
        -- current line number
        CursorLineNr = { fg = mocha.sky },
        -- cursor line bg, same color as the background
        CursorLine = { bg = "NONE" },
      },
      -- color_overrides = {
      --   mocha = {
      --     base = "#000000",
      --     mantle = "#000000",
      --     crust = "#000000",
      --   },
      -- },
    },
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "rose-pine",
      -- colorscheme = "vscode",
      -- colorscheme = "catppuccin-mocha",
      colorscheme = "moonfly",
      -- colorscheme = "kanso",
      -- colorscheme = "oldworld",
      -- colorscheme = "base16-black-metal-gorgoroth",
      -- colorscheme = "vague",
      -- colorscheme = "github_dark_default",
      -- colorscheme = "dracula",
      -- colorscheme = "tokyonight-night",
    },
  },
}
