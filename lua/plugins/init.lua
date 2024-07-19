---@type LazySpec
return {
  { "max397574/better-escape.nvim", lazy = false },
  { "goolord/alpha-nvim", enabled = false },
  {"akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup{
                shell = "zsh", 
            }
        end
  },
}
