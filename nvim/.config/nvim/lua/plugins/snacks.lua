return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    --disabled the initial dashboard
    dashboard = { enabled = false },
    -- disabled smoothscroll
    scroll = { enabled = false },
    -- disabled indent
    indent = { enabled = false },
    picker = {},
  },
  keys = {
    {
      "tr",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gi",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
  },
}
