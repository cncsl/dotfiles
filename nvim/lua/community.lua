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
  --常用文件格式支持
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  --前端
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  --脚本
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  --python
  { import = "astrocommunity.pack.python" },
}
