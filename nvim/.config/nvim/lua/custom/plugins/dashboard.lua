return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'DrKJeff16/project.nvim',
  },
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      change_to_vcs_root = false,
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = ' Find File', group = 'Label', action = 'Telescope find_files', key = 'f' },
          { desc = ' New File', group = 'DiagnosticHint', action = 'ene | startinsert', key = 'n' },
          { desc = ' Quit', group = 'Error', action = 'qa', key = 'q' },
        },
        packages = { enable = true },

        project = {
          enable = true,
          limit = 8,
          icon = '󰏆 ',
          label = ' Projects',
          action = 'Telescope find_files cwd=',
        },

        mru = {
          enable = true,
          limit = 10,
          icon = ' ',
          label = ' Recent Files',
          cwd_only = false,
        },
        footer = {},
      },
    }
  end,
}
