return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        [";"] = { ":", desc = "CMD enter command mode" },
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["-"] = {
          "<cmd>split<cr>",
          desc = "Horizontal Split",
        },
        ["<C-_>"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Comment Line",
        },
        ["<Leader>j"] = {
          "*``cgn",
          desc = "Replace Word under Cursor",
        },
        ["<Leader><Leader>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
        -- ["<Leader>gho"] = {
        --   "<cmd>GhostTextStart<cr>",
        --   desc = "Start GhostText",
        -- },
      },
      i = {
        ["<C-_>"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Comment Line",
        },
      },
    },
  },
}
