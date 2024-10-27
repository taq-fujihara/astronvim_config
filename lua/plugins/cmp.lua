return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")
    -- Wezterm sends <F20> for Shift+Space, which neovim doesn't recognize
    opts.mapping["<F20>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" })
  end,
}
