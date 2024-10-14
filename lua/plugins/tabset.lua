return {
  "FotiadisM/tabset.nvim",
  opts = {
    defaults = {
      tabwidth = 2,
      expandtab = true,
    },
    languages = {
      go = {
        tabwidth = 4,
        expandtab = false,
      },
      {
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml" },
        config = {
          tabwidth = 2,
        },
      },
    },
  },
}
