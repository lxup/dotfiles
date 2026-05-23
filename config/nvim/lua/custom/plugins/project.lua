return {
  'DrKJeff16/project.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('project').setup {
      detection_methods = { 'pattern', 'lsp' },

      patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },

      show_hidden = false,
      silent_chdir = true,
      datapath = vim.fn.stdpath 'data',

      telescope = {
        mappings = {
          i = {
            ['<CR>'] = 'change_working_directory',
          },
          n = {
            ['<CR>'] = 'change_working_directory',
          },
        },
      },
    }

    require('telescope').load_extension 'projects'

    vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = ' Find Projects' })
  end,
}
