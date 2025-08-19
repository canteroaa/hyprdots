-- ColorScheme
-- local colors = require("catppuccin.palettes").get_palette()
-- local TelescopeColor = {
--   TelescopeMatching = { fg = colors.flamingo },
--   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
--   TelescopePromptPrefix = { bg = colors.surface0, fg = colors.red },
--   TelescopePromptNormal = { bg = colors.surface0 },
--   TelescopeResultsNormal = { bg = colors.mantle },
--   TelescopePreviewNormal = { bg = colors.mantle },
--   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
--   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
--   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
--   TelescopePromptTitle = { bg = colors.red, fg = colors.mantle },
--   TelescopeResultsTitle = { fg = colors.mantle },
--   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
-- }
--
-- for hl, col in pairs(TelescopeColor) do
--   vim.api.nvim_set_hl(0, hl, col)
-- end

-- plugin
return {
  "telescope.nvim",
  enabled = false,
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches({})
      end,
      desc = "Git Branches",
    },
    {
      -- enable to search special characters like "$"
      "<leader>sg",
      function()
        require("telescope.builtin").live_grep({
          vimgrep_arguments = table.insert(require("telescope.config").values.vimgrep_arguments, "--fixed-strings"),
        })
      end,
      desc = "Global Search",
    },
    {
      "tr",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Resume the previus telescope picker",
    },
    {
      "<leader>fx",
      function()
        local telescope = require("telescope")

        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = true,
          initial_mode = "normal",
          layout_config = { height = 40 },
        })
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    -- local actions = require("telescope.actions")
    -- local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      prompt_prefix = "  ",
      selection_caret = " ",
      -- wrap_results = true,
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      -- winblend = 0,
      -- mappings = {
      --   n = {},
      -- },
    })
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    -- require("telescope").load_extension("file_browser")
  end,
}
