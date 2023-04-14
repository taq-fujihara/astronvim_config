return {
  "mg979/vim-visual-multi",
  branch = "master",
  keys = "<C-d>",
  init = function()
    t = {}
    t["Find Under"] = "<C-d>"
    t['Find Subword Under'] = "<C-d>"
    vim.g.VM_maps = t
  end
}
