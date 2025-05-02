return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      prompts = {
        Explain = {
          mapping = '<leader>gce',
        },
        Review = {
          mapping = '<leader>gcr',
        },
        Fix = {
          mapping = '<leader>gcf',
        },
        Optimize = {
          mapping = '<leader>gco',
        },
        Docs = {
          mapping = '<leader>gcd',
        },
        Tests = {
          mapping = '<leader>gct',
        },
        Commit = {
          mapping = '<leader>gcc',
        },
      }
    },
  },
}
