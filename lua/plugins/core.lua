---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    filetypes = {
      filename = {
        ["docker-compose.yaml"] = "yaml.docker-compose",
      },
    },
    options = {
      opt = {
        wrap = true,
        title = false,
      },
    },
  },
}
