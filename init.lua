return {
  colorscheme = "tokyonight",
  lsp = {
    formatting = {
      disabled = {
        "volar",
      },
    },
    config = {
      pyright = function(opts)
        opts.on_new_config = function(new_config, new_root_dir)
          local util = require("lspconfig.util")
          local is_pipenv = util.root_pattern("Pipfile")(new_root_dir)
          if is_pipenv then
            new_config.cmd = { "pipenv", "run", "pyright-langserver", "--stdio" }
          end
        end
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json")
        opts.single_file_support = false
        return opts
      end,
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        opts.single_file_support = false
        return opts
      end,
    },
  },
  highlights = {
    init = {
      Normal = { bg = "NONE", ctermbg = "NONE" },
      NormalNC = { bg = "NONE", ctermbg = "NONE" },
      CursorColumn = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLine = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      CursorLineNr = { cterm = {}, ctermbg = "NONE", ctermfg = "NONE" },
      LineNr = {},
      SignColumn = {},
      StatusLine = {},
      NeoTreeNormal = { bg = "NONE", ctermbg = "NONE" },
      NeoTreeNormalNC = { bg = "NONE", ctermbg = "NONE" },
    },
  },
}
