return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- jsonnet-language-server will be automatically installed with mason and loaded with lspconfig
        jsonnet_ls = {},
      },
    },
  },
}
