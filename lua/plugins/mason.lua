---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "biome",
        "eslint",
        "lua_ls",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "svelte",
        "terraformls",
        "tsserver",
      })

      if opts.config == nil then opts.config = {} end
      opts.config.biome = {
        root_dir = require("lspconfig.util").root_pattern "biome.json",
      }
      opts.config.eslint = {
        root_dir = require("lspconfig.util").root_pattern ".eslintrc.*"
          or require("lspconfig.util").root_pattern "eslintrc.*"
          or require("lspconfig.util").root_pattern "eslint.config.*",
      }
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "prettier",
        "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        -- "python",
        -- add more arguments for adding more debuggers
      })
    end,
  },
}
