return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.cursorcolumn = true
    require("everforest").setup {
      background = "hard",
      transparent_background_level = 1,
      on_highlights = function(hl, palette)
        hl.CursorLine = {
          -- bg = palette.bg0,
        }
        hl.CursorColumn = {
          bg = palette.bg0,
        }
      end,
    }
  end,
}
