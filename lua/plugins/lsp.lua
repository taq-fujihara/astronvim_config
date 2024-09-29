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
          root_dir = require("lspconfig.util").root_pattern(
            "deno.json",
            "deno.jsonc",
            "deno.local.json" -- Git ignores this file in my environment. Just a flag to enable Deno LSP
          ),
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
        ts_ls = function(_, opts)
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
          require("lspconfig").ts_ls.setup(opts)
        end,
        -- ---------------------------------------------------
        -- Python
        -- ---------------------------------------------------
        ruff_lsp = function(_, opts)
          opts.on_attach = function(client, _) client.server_caapabilities.hoverProvider = false end
          require("lspconfig").ruff_lsp.setup(opts)
        end,
      },
      formatting = {
        disabled = {
          "volar", -- prefer prettier
          "ts_ls",
        },
        -- filter = function(client)
        --   -- do not let null-ls (actually biome) format if denols is attached
        --   if client.name == "null-ls" then
        --     local clients = (vim.lsp.get_clients or vim.lsp.get_active_clients) {
        --       name = "denols",
        --     }
        --     if #clients > 0 then return false end
        --   end
        --
        --   return true
        -- end,
      },
    },
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
                  name = "ts_ls",
                }
                for _, client in ipairs(clients) do
                  vim.lsp.stop_client(client.id, true)
                end
              end
              -- stop typescript server attached if there is a denols server attached
              if curr_client and curr_client.name == "ts_ls" then
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
