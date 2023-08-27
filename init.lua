return {
  colorscheme = "tokyonight",
  lsp = {
    formatting = {
      disabled = {
        "volar",
      },
    },
    config = {
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json")
        opts.single_file_support = false
        return opts
      end,
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        opts.single_file_support = false
        return opts
      end,
    },
  },
}
