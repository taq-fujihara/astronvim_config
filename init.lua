return {
  colorscheme = "astrodark",
  lsp = {
    formatting = {
      filter = function(client)
        if vim.bo.filetype == "vue" then
          return client.name == "null-ls"
        end

        return true
      end,
    },
  },
}

