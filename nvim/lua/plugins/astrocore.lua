-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        cursorline = false, -- sets vim.opt.cursorline
        scrolloff = 5, --sets vim.opt.scrolloff
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- unlike default configuration, there mappings action are not "force"
        ["<C-s>"] = { "<Cmd>w<CR>", desc = "Fast Save" },
        ["<C-q>"] = { "<Cmd>q<CR>", desc = "Fast Quit" },
        ["<C-x>"] = { "<Cmd>wq<CR>", desc = "Fast Save And Quit" },

        -- quickly resize split
        ["<M-h>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left", },
        ["<M-j>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down", },
        ["<M-k>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up", },
        ["<M-l>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right", },

        -- split
        ["_"] = { "<Cmd>split<CR>", desc = "Horizontal Split" },
        ["|"] = { "<Cmd>vsplit<CR>", desc = "Vertical Split" },


        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
