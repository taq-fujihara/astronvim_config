return {
  "subnut/nvim-ghost.nvim",
  tag = "v0.5.1",
  -- lazy = false,
  cmd = "GhostTextStart",
  init = function()
    -- t = {}
    -- t["Find Under"] = "<C-d>"
    -- t['Find Subword Under'] = "<C-d>"
    -- t["Add Cursor Down"] = ""
    -- t["Select Cursor Down"] = ""
    vim.g.nvim_ghost_autostart = 0
  end
}
