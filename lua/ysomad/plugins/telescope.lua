return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function ()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        buffers = {
          sort_mru = true,
          mappings = {
            i = {
             ["<C-d>"] = "delete_buffer",
            }
          }
        }
      }
    })

    telescope.load_extension("fzf")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files" })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Fuzzy find git files" })
    vim.keymap.set('n', '<leader>fb', function()
      builtin.buffers({sort_mru=true, ignore_current_buffer=true})
    end, { desc = "List opened buffers" })
    vim.keymap.set('n', '<leader>fg', function()
      builtin.grep_string({ search = vim.fn.input('Grep > ') });
    end, { desc = "Grep string" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "List help tags" })
    vim.keymap.set('n', '<leader>fx', builtin.treesitter, { desc = "List tresitter funcs, vars"})
  end
}
