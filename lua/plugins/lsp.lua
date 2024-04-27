return {
  {
    "AstroNvim/astrolsp",
    optional = true,
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        -- ---------------------------------------------------
        -- JavaScript / TypeScript
        -- ---------------------------------------------------
        eslint = {
          root_dir = require("lspconfig.util").root_pattern ".eslintrc.*"
            or require("lspconfig.util").root_pattern "eslintrc.*"
            or require("lspconfig.util").root_pattern "eslint.config.*",
        },
        biome = {
          root_dir = require("lspconfig.util").root_pattern "biome.json",
        },
        denols = {
          root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
        },
        volar = {
          filetypes = { "vue" },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        },
        -- ---------------------------------------------------
        -- Python
        -- ---------------------------------------------------
        pyright = {
          settings = {
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
          },
        },
      },
      handlers = {
        -- ---------------------------------------------------
        -- JavaScript / TypeScript
        -- ---------------------------------------------------
        tsserver = function(_, opts)
          -- Vue stuff
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
  },
  {
    "sigmasd/deno-nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = { { "AstroNvim/astrolsp", optional = true, opts = { handlers = { denols = false } } } },
    opts = function(_, opts)
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      if astrolsp_avail then opts.server = astrolsp.lsp_opts "denols" end
    end,
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- choose the correct language server
        typescript_deno_switch = {
          {
            event = "LspAttach",
            callback = function(args)
              local bufnr = args.buf
              local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

              if curr_client and curr_client.name == "denols" then
                local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients) {
                  bufnr = bufnr,
                  name = "tsserver",
                }
                for _, client in ipairs(clients) do
                  vim.lsp.stop_client(client.id, true)
                end
              end
              -- if tsserver attached, stop it if there is a denols server attached
              if curr_client and curr_client.name == "tsserver" then
                if next((vim.lsp.get_clients or vim.lsp.get_active_clients) { bufnr = bufnr, name = "denols" }) then
                  vim.lsp.stop_client(curr_client.id, true)
                end
              end
            end,
          },
        },
      },
    },
  },
}
