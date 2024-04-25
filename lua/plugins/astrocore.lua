-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- -- Configure core features of AstroNvim
    -- features = {
    --   large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
    --   autopairs = true, -- enable autopairs at start
    --   cmp = true, -- enable completion at start
    --   diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
    --   highlighturl = true, -- highlight URLs at start
    --   notifications = true, -- enable notifications at start
    -- },
    -- -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    -- diagnostics = {
    --   virtual_text = true,
    --   underline = true,
    -- },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "",
        mouse = "r",
      },
    },
    mappings = {
      n = {
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        n = { "nzzzv" },
        N = { "Nzzzv" },
      },
      v = {
        ["<Leader>y"] = { '"+y', desc = "Copy to system buffer" },
        J = { ":m '>+1<CR>gv=gv" },
        K = { ":m '>-2<CR>gv=gv" },
        [">"] = { ">gv" },
        ["<"] = { "<gv" },
      },
    },
  },
}
