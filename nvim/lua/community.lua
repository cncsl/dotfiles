-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  --theme
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  --ui/ux
  { import = "astrocommunity.recipes.astrolsp-no-insert-inlay-hints" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  -- lsp
  { import = "astrocommunity.lsp.nvim-lsp-file-operations"},
  -- 暂时没有自定义需求的 pack
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
}
