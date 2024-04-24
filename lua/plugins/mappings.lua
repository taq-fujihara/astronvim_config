return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["gt"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["gT"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
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
