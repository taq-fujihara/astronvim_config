local function has_prettier_config(utils)
  return utils.has_file(
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    "prettier.config.js",
    ".prettierrc.mjs",
    "prettier.config.mjs",
    "prettier.config.cjs",
    ".prettierrc.toml"
  )
end

local function has_deno_config(utils)
  return utils.has_file(
    "deno.json",
    "deno.jsonc",
    ".deno.local" -- Git ignores this file in my environment. Just a flag to enable Deno LSP.
  )
end

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- ---------------------------------------------------
      -- JavaScript / TypeScript
      -- ---------------------------------------------------
      -- Use Prettier only when prettier config is present 
      null_ls.builtins.formatting.prettier.with {
        condition = has_prettier_config,
      },
      -- Default Biome
      null_ls.builtins.formatting.biome.with {
        condition = function(utils)
          local has_prettier = has_prettier_config(utils)
          local has_deno = has_deno_config(utils)
          return not (has_prettier or has_deno)
        end,
      },
      -- ---------------------------------------------------
      -- Lua
      -- ---------------------------------------------------
      null_ls.builtins.formatting.stylua,
      -- ---------------------------------------------------
      -- Docker
      -- ---------------------------------------------------
      null_ls.builtins.diagnostics.hadolint,
    }
    return config
  end,
}
