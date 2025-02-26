return {
  "folke/snacks.nvim",
  opts = {
    gitbrowse = {
      config = function(opts, defaults)
        table.insert(opts.remote_patterns, { "ssh.(source.tui)", "%1" })
      end,
      url_patterns = {
        ["source%.tui"] = {
          branch = "/-/tree/{branch}",
          file = "/-/blob/{branch}/{file}#L{line_start}-L{line_end}",
          permalink = "/-/blob/{commit}/{file}#L{line_start}-L{line_end}",
          commit = "/-/commit/{commit}",
        },
      },
    },
  },
}
