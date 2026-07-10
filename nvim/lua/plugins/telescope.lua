return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")

      local exclude_local_packages = true

      -- directories to prune entirely (fd/rg won't descend into these at all)
      local base_exclude_dirs = { '.git', 'node_modules', '.venv', 'Library' }
      -- file globs to skip (still visited, but cheap compared to walking a whole dir)
      local base_exclude_globs = { '*.meta', '*.png', '*.prefab', '*.prefab.comment', '*.mat', '*.anim', '*.asmdef', '*.asset' }

      local function exclude_dirs()
        local dirs = vim.deepcopy(base_exclude_dirs)
        if exclude_local_packages then
          table.insert(dirs, 'LocalPackages')
        end
        return dirs
      end

      local function find_command()
        local cmd = { 'fd', '--type', 'f', '--hidden', '--strip-cwd-prefix' }
        for _, dir in ipairs(exclude_dirs()) do
          table.insert(cmd, '--exclude')
          table.insert(cmd, dir)
        end
        for _, glob in ipairs(base_exclude_globs) do
          table.insert(cmd, '--exclude')
          table.insert(cmd, glob)
        end
        return cmd
      end

      local function grep_additional_args()
        local args = {}
        for _, dir in ipairs(exclude_dirs()) do
          table.insert(args, '--glob=!' .. dir .. '/*')
        end
        for _, glob in ipairs(base_exclude_globs) do
          table.insert(args, '--glob=!' .. glob)
        end
        return args
      end

      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set('n', '<leader>fg', function()
        builtin.live_grep({ additional_args = grep_additional_args })
      end, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ find_command = find_command() })
      end, {})
      vim.keymap.set('n', '<leader>fc', builtin.git_commits, {})
      vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
      vim.keymap.set('n', '<leader>fL', function()
        exclude_local_packages = not exclude_local_packages
        vim.notify('Telescope LocalPackages/ ' .. (exclude_local_packages and 'excluded' or 'included'))
      end, { desc = 'Toggle LocalPackages/ in Telescope ff/fg' })
    end
    },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          preview = {
            treesitter = false,
          },
          file_ignore_patterns = { 'node_modules', '.git', '.venv', '%.meta$' },
        },
        pickers = {
          find_files = {
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
