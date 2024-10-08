---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "astro",
      "css",
      "dockerfile",
      "html",
      "java",
      "javascript",
      "lua",
      "python",
      "scss",
      "sql",
      "svelte",
      "toml",
      "typescript",
      "vue",
      "vim",
    })
  end,
}
