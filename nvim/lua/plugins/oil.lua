return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  opts = {
    view_options = {
      is_always_hidden = function(name, _)
        return name:match("%.meta$") ~= nil
      end,
    },
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      -- ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = false,
    view_options = {
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        if vim.startswith(name, ".") then
          return true
        end
        if vim.endswith(name, ".meta") then
          return true
        end
        if vim.endswith(name, ".csproj") then
          return true
        end
        if vim.endswith(name, ".config") then
          return true
        end
        if vim.endswith(name, ".sln") then
          return true
        end
        if vim.endswith(name, ".DotSettings.user") then
          return true
        end
        if vim.endswith(name, ".uid") then
          return true
        end
        return false
      end,
    }
  },
  lazy = false,
}
