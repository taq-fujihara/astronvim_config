local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = ' '

require("lazy").setup({
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    version = "*",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
            label = {
              uppercase = false,
            },
            autojump = true,
          })
        end,
        desc = "Flash",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
})

vim.keymap.set("n", "|", "<Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>")
vim.keymap.set("n", "-", "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>")
vim.keymap.set("n", "gt", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
vim.keymap.set("n", "gT", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
vim.keymap.set("n", "<Leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<Leader>fb", "<Cmd>call VSCodeNotify('workbench.action.showAllEditors')<CR>")
vim.keymap.set("n", "<Leader>fw", "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>")
vim.keymap.set("n", "<Leader>e", "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
vim.keymap.set("n", "<Leader>o", "<Cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>")
vim.keymap.set("n", "<Leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")
vim.keymap.set("n", "<Leader>q", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set("n", "<Leader>n", "<Cmd>call VSCodeNotify('fileutils.newFileAtRoot')<CR>")
vim.keymap.set("n", "<Leader>/", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
vim.keymap.set("n", "<Leader>gg", "<Cmd>call VSCodeNotify('workbench.scm.focus')<CR>")
vim.keymap.set("v", "<Leader>/", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")
vim.keymap.set("v", "<Leader>w", "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")
vim.keymap.set("n", "<Leader>j", "*``cgn")
