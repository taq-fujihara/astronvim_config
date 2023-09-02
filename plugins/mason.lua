return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- "cssls",
        "denols",
        "marksman",
        "pyright",
        "eslint",
        -- "rust_analyzer",
        -- "svelte",
        "terraformls",
        "tsserver",
        "volar",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "black",
        "flake8",
        "prettier",
        "tflint",
        "tfsec",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python" }
    }
  },
}
