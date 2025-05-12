return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        [";"] = { ":", desc = "CMD enter command mode" },

        ["<Left>"] = { "<Cmd>vertical resize +4<CR>", desc = "Resize split left" },
        ["<Up>"] = { "<Cmd>resize -2<CR>", desc = "Resize split up" },
        ["<Down>"] = { "<Cmd>resize +2<CR>", desc = "Resize split down" },
        ["<Right>"] = { "<Cmd>vertical resize -4<CR>", desc = "Resize split right" },

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
        ["<Leader><Leader>"] = {
          function() require("snacks").picker.smart() end, desc = "Find buffers",
        },
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
        ["<Leader>ll"] = {
          function()
            local fn = vim.api.nvim_buf_get_name(0)
            local ft = vim.bo.filetype

            for i in string.gmatch(fn, "[^/]+") do
              fn = i
            end

            local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)

            if ft == "javascript" or ft == "typescript" then
              vim.api.nvim_feedkeys("yoconsole.log(\"🚀 ~ " .. fn .. " ~ " .. esc .. "pa:\", " .. esc .. "pa);" .. esc.. "0", "n", true)
            elseif ft == 'python' then
              vim.api.nvim_feedkeys("yoprint(\"🚀 ~ " .. fn .. " ~ " .. esc .. "pa:\", " .. esc .. "pa)" .. esc.. "0", "n", true)
            else
              print("🚀 TurboStdout -> Filetype: \"" .. ft .. "\" is not supported")
            end
          end,
          desc = "Turbo Stdout"
        },
      }
    },
  },
}
