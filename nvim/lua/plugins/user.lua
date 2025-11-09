---@type LazySpec
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = true, -- only works on Windows for hidden files/directories
          hide_by_name = {
            "node_modules",
            "target",
            ".vscode",
            ".idea",
            ".git",
          },
          hide_by_pattern = { -- uses glob style patterns
            --"*.meta",
            --"*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            --".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            ".DS_Store",
            "thumbs.db",
          },
          never_show_by_pattern = { -- uses glob style patterns
            --".null-ls_*",
          },
        },
      },
    },
  },
  {
    {
      "wakatime/vim-wakatime",
      lazy = false,
    },
  },
  {
    "keaising/im-select.nvim",
    config = function()
      require("im_select").setup {
        default_im_select = "com.apple.keylayout.ABC",
        default_command = "im-select",

        -- Restore the default input method state when the following events are triggered
        set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" },

        -- Restore the previous used input method state when the following events
        -- are triggered, if you don't want to restore previous used im in Insert mode,
        -- e.g. deprecated `disable_auto_restore = 1`, just let it empty
        -- as `set_previous_events = {}`
        set_previous_events = { "InsertEnter" },

        -- Async run `default_command` to switch IM or not
        async_switch_im = true,
      }
    end,
  },
  {
    "okuuva/auto-save.nvim",
    event = { "User AstroFile", "InsertEnter" },
    opts = {
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
        defer_save = { },
        cancel_deferred_save = { },
      },
    },
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          autoformat_toggle = {
            -- Disable autoformat before saving
            {
              event = "User",
              desc = "Disable autoformat before saving",
              pattern = "AutoSaveWritePre",
              callback = function()
                -- Save global autoformat status
                vim.g.OLD_AUTOFORMAT = vim.g.autoformat
                vim.g.autoformat = false

                local old_autoformat_buffers = {}
                -- Disable all manually enabled buffers
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                  if vim.b[bufnr].autoformat then
                    table.insert(old_autoformat_buffers, bufnr)
                    vim.b[bufnr].autoformat = false
                  end
                end

                vim.g.OLD_AUTOFORMAT_BUFFERS = old_autoformat_buffers
              end,
            },
            -- Re-enable autoformat after saving
            {
              event = "User",
              desc = "Re-enable autoformat after saving",
              pattern = "AutoSaveWritePost",
              callback = function()
                -- Restore global autoformat status
                vim.g.autoformat = vim.g.OLD_AUTOFORMAT
                -- Re-enable all manually enabled buffers
                for _, bufnr in ipairs(vim.g.OLD_AUTOFORMAT_BUFFERS or {}) do
                  vim.b[bufnr].autoformat = true
                end
              end,
            },
          },
        },
      },
    },
  },
}
