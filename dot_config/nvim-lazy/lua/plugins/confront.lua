return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      shfmt = {
        prepend_args = { "-i", "4", "-ci" },
      },
    },
  },
}
