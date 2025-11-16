return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
    end
    },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        pickers = {
          find_files = {
            file_ignore_patterns = { 'node_modules', '.git', '.venv' },
            hidden = true
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          },
        },
      })
      telescope.load_extension("ui-select")
    end
  },
}
