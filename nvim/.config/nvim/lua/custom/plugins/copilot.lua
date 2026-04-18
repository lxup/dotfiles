return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    require('copilot').setup {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<Tab>',
          accept_word = false,
          accept_line = '<A-a>',
          next = '<M-]>',
          prev = '<M-[>',
          dismiss = '<C-]>',
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        ['.'] = false,
      },
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuOpen',
      callback = function() vim.b.copilot_suggestion_hidden = true end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'BlinkCmpMenuClose',
      callback = function() vim.b.copilot_suggestion_hidden = false end,
    })
  end,
}
