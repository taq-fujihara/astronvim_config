local color_scheme = os.getenv("MY_COLOR_SCHEME")

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = color_scheme,
  },
}
