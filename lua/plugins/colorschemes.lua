return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      extra_groups = {
        "NormalFloat",
        "GitSignsAdd",
        "GitSignsChange",
        "GitSignsDelete",
        "WinBar",
      },
      exclude_groups = {
        "CursorLine",
      },
    },
  },
  {
    "cocopon/iceberg.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TransparentClear",
        callback = function()
          local attrs = { background = "#2a2c46", bg = "#2a2c46" }
          vim.api.nvim_set_hl(0, "TreesitterContext", attrs)
          vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", attrs)
        end,
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      sidebars = "transparent",
      floats = "transparent",
    },
  },
  {
    "Shatur/neovim-ayu",
    enabled = false,
    name = "ayu",
    opts = {
      mirage = true,
      overrides = {
        Normal = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        WhichKeyFloat = { bg = "None" },
        VertSplit = { bg = "None" },
      },
    },
  },
  {
    "neanias/everforest-nvim",
    enabled = false,
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
            bg = palette.bg2,
          }
          hl.CursorColumn = {
            bg = palette.bg2,
          }
        end,
      }
    end,
  },
  {
    'shaunsingh/nord.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_cursorline_transparent = true
      vim.g.nord_italic = false
      vim.g.nord_bold = false
    end,
  },
}
