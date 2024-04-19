return {
  "AstroNvim/astrolsp",
  ---@param opts AstroLSPOpts
  opts = {
    handlers = {
      pyright = function(_, opts)
        opts.settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        }
        require("lspconfig").pyright.setup(opts)
      end,
      ruff_lsp = function(_, opts)
        opts.on_attach =
          function(client, bufnr) client.server_caapabilities.hoverProvider = false end,
          require("lspconfig").ruff_lsp.setup(opts)
      end,
    },
  },
}
