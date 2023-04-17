return {
  "APZelos/blamer.nvim",
  branch = "master",
  event = "VeryLazy",
  init = function()
    vim.g.blamer_enabled = 1
    vim.g.blamer_delay = 500
    vim.g.blamer_prefix = '    '
    vim.g.blamer_date_format = "%Y/%m/%d"
    vim.g.blamer_relative_time = 1
  end,
}
