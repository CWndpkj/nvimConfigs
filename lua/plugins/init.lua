---@type LazySpec
return {
  { "max397574/better-escape.nvim", enabled = false },
  { "goolord/alpha-nvim" },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup {
        shell = "zsh",
      }
    end,
  },
}
