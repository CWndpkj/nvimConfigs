if not vim.g.neovide then vim.g.gruvbox_baby_transparent = true end
vim.g.gruvbox_baby_color_overrides = {
  background_dark = "#101010",
  background_light = "#3f3f3f",
  background = "#1e1e1e",
  comment = "#8f8f8f",
  medium_gray = "#606060"
}
return {
  "luisiacc/gruvbox-baby",
  lazy = true,
  priority = 1000,
}
