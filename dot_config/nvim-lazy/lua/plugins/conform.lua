return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      shfmt = {
        prepend_args = { "-i", "4", "-ci" },
      },
      terragrunt_hclfmt = {
        args = { "hcl", "fmt", "--file", "$FILENAME" },
      },
    },
  },
}
