return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        [";"] = { ":", desc = "CMD enter command mode" },

        ["<C-S-j>"] = { "<Cmd>resize -2<CR>", desc = "Resize split up" },
        ["<C-S-k>"] = { "<Cmd>resize +2<CR>", desc = "Resize split down" },
        ["<C-S-l>"] = { "<Cmd>vertical resize -4<CR>", desc = "Resize split left" },
        ["<C-S-h>"] = { "<Cmd>vertical resize +4<CR>", desc = "Resize split right" },

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
        ["<Leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo({ buflisted = true })
            require("astrocore.buffer").close(0)
            if
              require("astrocore").is_available("alpha-nvim") and not bufs[2]
            then
              require("alpha").start()
            end
          end,
          desc = "Close buffer",
        },
        ["<Leader>a"] = {
          "ggVG",
          desc = "Select All",
        },
       },
      i = {
        ["<C-_>"] = {
          function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Comment Line",
        },
      },
      v = {
        [";"] = { ":", desc = "CMD enter command mode" },
      }
    },
  },
}
