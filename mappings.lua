return {
  n = {
    ["gt"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer",
    },
    ["gT"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer",
    },
    ["f"] = {
      function() require("hop").hint_char2({}) end,
      desc = "HopChar2",
    },
    ["<C-\\>"] = {
      "<cmd>vsplit<cr>",
      desc = "Vertical Split",
    },
  },
}

