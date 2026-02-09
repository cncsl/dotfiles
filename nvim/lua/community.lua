-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  --editor
  { import = "astrocommunity.motion.nvim-surround"},
  --theme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  --ui/ux
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  --comment
  { import = "astrocommunity.comment.ts-comments-nvim" },
  -- pack
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.markdown" },
  -- vue
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.vue" },
}
