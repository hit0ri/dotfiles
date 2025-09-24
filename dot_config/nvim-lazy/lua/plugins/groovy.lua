return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "groovy" } },
  },

  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "npm-groovy-lint", "groovy-language-server" } },
  },

  -- Disabled due to performance issues
  -- {
  --   "mfussenegger/nvim-lint",
  --   optional = true,
  --   opts = {
  --     linters_by_ft = {
  --       Jenkinsfile = { "npm-groovy-lint" },
  --       groovy = { "npm-groovy-lint" },
  --     },
  --   },
  -- },
  --
  -- {
  --   "stevearc/conform.nvim",
  --   optional = true,
  --   opts = {
  --     default_format_opts = {
  --       timeout_ms = 5000,
  --     },
  --     formatters_by_ft = {
  --       Jenkinsfile = { "npm-groovy-lint" },
  --       groovy = { "npm-groovy-lint" },
  --     },
  --   },
  -- },
}
