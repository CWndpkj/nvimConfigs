local function init_opts()
  if vim.g.neovide then
    return {
      filter = "machine",
    }
  else
    return {}
  end
end
return {
  "loctvl842/monokai-pro.nvim",
  lazy = true,
  priority = 1000,
  opts = function(_, opts) return require("astrocore").extend_tbl(opts, init_opts()) end,
}
