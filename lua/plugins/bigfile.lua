--Custom features:disable highlight-colors plugin
local highlight_color = {
  name = "highlight_color", -- name
  opts = {
    defer = false, -- set to true if `disable` should be called on `BufReadPost` and not `BufReadPre`
  },
  disable = function() -- called to disable the feature
    vim.cmd "HighlightColors off"
  end,
}
return {
  "LunarVim/bigfile.nvim",
  config = function()
    require("bigfile").setup {
      filesize = 1,
      pattern = function(bufnr)
        -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
        local file_oneline = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr), "", 1)
        -- local file_sizes = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
        -- local filetype = vim.filetype.match { buf = bufnr }
        if file_oneline[1] then
          if #file_oneline[1] > 500 then
            vim.notify("Big file detected", vim.log.levels.INFO)
            return true
          end
        end
        return false
      end,
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
        highlight_color,
      },
    }
  end,
}
