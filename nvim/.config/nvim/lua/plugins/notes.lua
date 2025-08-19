return {

  "JellyApple102/flote.nvim",
  event = "VeryLazy",
  config = function()
    require("flote").setup({
      window_title = false,
      window_border = "double",
    })
  end,
}
