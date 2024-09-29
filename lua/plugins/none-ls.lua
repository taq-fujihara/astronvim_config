local function has_prettier_config(utils)
  return utils.has_file ".prettierrc"
    or utils.has_file ".prettierrc.json"
    or utils.has_file ".prettierrc.yml"
    or utils.has_file ".prettierrc.yaml"
    or utils.has_file ".prettierrc.json5"
    or utils.has_file ".prettierrc.js"
    or utils.has_file ".prettierrc.cjs"
    or utils.has_file "prettier.config.js"
    or utils.has_file ".prettierrc.mjs"
    or utils.has_file "prettier.config.mjs"
    or utils.has_file "prettier.config.cjs"
    or utils.has_file ".prettierrc.toml"
end

local function has_deno_config(utils)
  return utils.has_file "deno.json"
    or utils.has_file "deno.jsonc"
    or "deno.local.json" -- Git ignores this file in my environment. Just a flag to enable Deno LSP
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
      null_ls.builtins.formatting.biome.with {
        -- Default
        condition = function(utils) return not has_prettier_config(utils) and not has_deno_config(utils) end,
      },
      null_ls.builtins.formatting.prettier.with {
        -- I use prettier only when prettier config is present
        condition = has_prettier_config,
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
