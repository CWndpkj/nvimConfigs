---@type LazySpec
return {
  { "max397574/better-escape.nvim", enabled = false },
  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      local os_name = require("utils").get_os_name()
      if os_name == "macos" then
        opts.shell = "zsh"
      elseif os_name == "linux" then
        opts.shell = "zsh"
      elseif os_name == "windows" then
        vim.opt.shell = "pwsh"
        vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
        vim.opt.shellquote = ""
        vim.opt.shellxquote = ""
        opts.shell = "pwsh"
      end
    end,
  },
}
