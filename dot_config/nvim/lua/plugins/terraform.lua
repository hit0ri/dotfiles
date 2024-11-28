return {
  { import = "lazyvim.plugins.extras.lang.terraform" },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        terraform = { "tflint", "tfsec" },
        tf = { "tflint", "tfsec" },
        ["terraform-vars"] = { "tflint", "tfsec" },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "tflint", "tfsec" } },
  },
}
