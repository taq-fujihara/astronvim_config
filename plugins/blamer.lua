return {
  "APZelos/blamer.nvim",
  branch = "master",
  event = "VeryLazy",
  init = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 500
  end,
}
