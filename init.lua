return {
  colorscheme = "tokyonight",
  lsp = {
    formatting = {
      disabled = {
        "volar",
      },
    },
    config = {
    --   denols = function(opts)
    --     opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
    --     return opts
    --   end,
    --   tsserver = function(opts)
    --     opts.root_dir = require("lspconfig.util").root_pattern "package.json"
    --     return opts
    --   end,
    },
  },
}
