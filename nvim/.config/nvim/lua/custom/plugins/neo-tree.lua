return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle Explorer', silent = true },
    { '<leader>E', ':Neotree reveal<CR>', desc = 'Reveal File in Explorer', silent = true },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      window = {
        position = 'left',
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  end,
}