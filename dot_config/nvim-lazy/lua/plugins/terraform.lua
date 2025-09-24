return {
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
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "tflint", "tfsec" } },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        hcl = { "terragrunt_hclfmt" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
}
