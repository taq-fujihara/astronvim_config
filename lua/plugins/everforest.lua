return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup {
      background = "hard",
      transparent_background_level = 1,
      on_highlights = function(hl, palette)
        hl.CursorLine = {
          bg = palette.bg_dim,
        }
      end,
    }
  end,
}
