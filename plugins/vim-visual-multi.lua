return {
  "mg979/vim-visual-multi",
  branch = "master",
  lazy = false,
  priority = 0,
  init = function()
    t = {}
    t["Find Under"] = "<C-d>"
    t['Find Subword Under'] = "<C-d>"
    -- t["Add Cursor Down"] = ""
    -- t["Select Cursor Down"] = ""
    vim.g.VM_maps = t
  end
}

