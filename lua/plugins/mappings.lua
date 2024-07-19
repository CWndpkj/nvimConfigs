return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          -- <Leader>d
          ["<Leader>b"] = { name = "Buffers" },
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bd"] = {
            function() require("astrocore.buffer").close(0) end,
            desc = "Close current buffer",
          },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          --<Leader>c
          ["<Leader>c"] = {"Cmake tasks"},
          ["<Leader>cr"] = {
            function()
              local cmake_tools = require "cmake-tools"
              if cmake_tools.is_cmake_project() then vim.cmd "CMakeRun" end
            end,
            desc = "Cmake run",
          },
          ["<Leader>ct"] = { "<cmd>CMakeRunTest<cr>", desc = "Run test" },
          ["<Leader>cd"] = { "<cmd>CMakeDebug<cr>", desc = "Start Debug" },
          ["H"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
          ["L"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
          ["K"] = { function() vim.lsp.buf.hover() end, desc = "Lsp show hover info" },
          ["J"] = { function() vim.lsp.buf.signature_help() end, desc = "Lsp show signature help" },
          -- ["<Leader>ot"] = { "<cmd>OverseerToggle<cr>", desc = "Toggle overseer task list" },
          -- ["<Leader>or"] = { "<cmd>OverseerRun<cr>", desc = "List overseer run templates" },

          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          -- condition for only server with declaration capabilities
        },
      },
    },
  },
}
