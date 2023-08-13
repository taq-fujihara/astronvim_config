return {
  colorscheme = "astrodark",
  lsp = {
    formatting = {
      filter = function(client)
        if vim.bo.filetype == "vue" then
          return client.name == "null-ls"
        end

        return true
      end,
    },
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern "package.json"
        return opts
      end,
    },
  },
}
