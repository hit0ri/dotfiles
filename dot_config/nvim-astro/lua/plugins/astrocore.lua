-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        clipboard = "unnamed", -- do not send text into system clipboard
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
        -- [">"] = { ">gv" },
        -- ["<"] = { "<gv" },
      },
    },
    rooter = {
      autochdir = true,
    },
  },
}
