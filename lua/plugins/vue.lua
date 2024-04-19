return {
  "AstroNvim/astrolsp",
  optional = true,
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable: missing-fields
    config = {
      volar = {
        filetypes = { "vue" },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      },
    },
    handlers = {
      tsserver = function(_, opts)
        local mason_registry = require "mason-registry"
        local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server"

        opts.init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = vue_language_server_path,
              languages = { "vue" },
            },
          },
        }
        require("lspconfig").tsserver.setup(opts)
      end,
    },
    formatting = {
      disabled = {
        "volar", -- prefer prettier
      },
    },
  },
}
