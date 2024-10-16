return {
  "FotiadisM/tabset.nvim",
  opts = {
    defaults = {
      tabwidth = 2,
      expandtab = true,
    },
    languages = {
      {
        filetypes = { "c", "cpp,", "python" },
        config = {
          tabwidth = 4,
          expandtab = true,
        },
      },
      {
        filetypes = { "go", "makefile" },
        config = {
          tabwidth = 4,
          expandtab = false,
        },
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
