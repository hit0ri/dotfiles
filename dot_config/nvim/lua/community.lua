-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.rose-pine" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.chezmoi" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.flash-nvim" },
}
