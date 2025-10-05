return {
  -- tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "css-lsp",
        -- "phpactor",
        "intelephense",
        "vue-language-server",
        "tailwindcss-language-server",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- phpactor = {},
        intelephense = {},
        -- volar = {
        --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        --   init_options = {
        --     vue = {
        --       hybridMode = false,
        --     },
        --   },
        -- },

        --Other vue config (works)
        -- tsserver = {
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = "/home/aaron/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/language-server",
        --         languages = { "vue" },
        --       },
        --     },
        --   },
        --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        -- },
        -- volar = {},
        tailwindcss = {},
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "blade",
            "blade.php",
          },
        },
      },
      setup = {},
    },
  },
}
