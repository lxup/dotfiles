return {
  'petertriho/nvim-scrollbar',
  event = 'BufReadPost',
  config = function()
    local scrollbar = require('scrollbar')
    
    scrollbar.setup({
      show = true,
      handle = {
        color = '#565f89',
      },
      handlers = {
        cursor = true,
        diagnostic = true,
        search = true,
      },
    })

    require("scrollbar.handlers").register("my_marks", function(bufnr)
        return {
            { line = 0 },
            { line = 1, text = "x", type = "Warn" },
            { line = 2, type = "Error" }
        }
    end)
  end,
}