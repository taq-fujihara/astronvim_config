---@type LazySpec
return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "biome",
        "denols",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "lua_ls",
        "pyright",
        "ruff_lsp",
        "rust_analyzer",
        "svelte",
        "taplo",
        "terraformls",
        "tsserver",
        "volar",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.handlers = require("astrocore").extend_tbl(opts.handlers, {
        biome = function()
          -- let none-ls handle biome
        end,
      })
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "selene",
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
