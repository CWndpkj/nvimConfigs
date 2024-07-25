local utils = require "utils"

return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
    local project_type = require("utils").detect_project_type()
    print("workspace_type", project_type)
    local maps = opts.mappings
    if maps then
      -- Project Tasks mappings
      if project_type == "C/C++" then
        maps.n["<Leader>c"] = { "", desc = "Cmake tasks" }
        maps.n["<Leader>cr"] = {
          function()
            local cmake_tools = require "cmake-tools"
            if cmake_tools.is_cmake_project() then vim.cmd "CMakeRun" end
          end,
          desc = "Run",
        }
        maps.n["<Leader>cb"] = { "<Cmd>CMakeBuild<CR>", desc = "Build" }
        maps.n["<Leader>ct"] = { "<Cmd>CMakeRunTest<CR>", desc = "Test" }
        maps.n["<Leader>cd"] = { "<Cmd>CMakeDebug<CR>", desc = "Debug" }
        maps.n["<F5>"] ={"<cmd>CMakeDebug<cr>",desc="Debug"}
      elseif project_type == "Rust" or project_type == "Python" or project_type == "Frontend" then
        if project_type == "Rust" then
          maps.n["<Leader>c"] = { "", desc = "Cargo tasks" }
        elseif project_type == "Python" then
          maps.n["<Leader>c"] = { "", desc = "Python tasks" }
        elseif project_type == "Frontend" then
          maps.n["<Leader>c"] = { "", desc = "Frontend tasks" }
        end
        local overseer = require "overseer"
        maps.n["<Leader>cb"] = {
          function() overseer.run_template { tags = { overseer.TAG.BUILD } } end,
          desc = "Build",
        }
        maps.n["<Leader>cr"] = {
          function() overseer.run_template { tags = { overseer.TAG.RUN } } end,
          desc = "Run",
        }
        maps.n["<Leader>ct"] = {
          function() overseer.run_template { tags = { overseer.TAG.TEST } } end,
          desc = "Test",
        }
        maps.n["<Leader>cd"] = {
          function() overseer.run_template { tags = { overseer.TAG.DEBUG } } end,
          desc = "Debug",
        }
      end

      -- term mode mappings
      maps.t["jk"] = { "<C-\\><C-n>", desc = "Exit term mode" }
      maps.t["<esc>"] = { "<C-\\><C-n>", desc = "Exit term mode" }

      -- <Leader>n
      maps.n["<Leader>n"] = { "", desc = "Highlights" }
      -- close search highlight
      maps.n["<Leader>nh"] = { ":nohlsearch<CR>", desc = "Close search highlight", silent = true }

      -- <Leader>b buffer navigation
      maps.n["b"] = { "", desc = "Buffer" }
      maps.n["bd"] = { "<Cmd>BufferClose<CR>", desc = "Close Current Buffer" }

      maps.n.n = { utils.better_search "n", desc = "Next search" }
      maps.n.N = { utils.better_search "N", desc = "Previous search" }

      maps.v["J"] = { ":move '>+1<CR>gv-gv", desc = "Move line down", silent = true }
      maps.v["K"] = { ":move '<-2<CR>gv-gv", desc = "Move line up", silent = true }

      maps.i["<C-S>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
      maps.x["<C-S>"] = { "<esc>:w<cr>a", desc = "Save file", silent = true }
      maps.n["<C-S>"] = { "<Cmd>w<cr>", desc = "Save file", silent = true }

      maps.v["p"] = { "pgvy", desc = "Paste" }

      maps.n["n"] = { "nzz" }
      maps.n["N"] = { "Nzz" }
      maps.v["n"] = { "nzz" }
      maps.v["N"] = { "Nzz" }

      maps.n["H"] = { "^", desc = "Go to start without blank" }
      maps.n["L"] = { "$", desc = "Go to end without blank" }

      maps.v["<"] = { "<gv", desc = "Unindent line" }
      maps.v[">"] = { ">gv", desc = "Indent line" }

      -- 在visual mode 里粘贴不要复制
      maps.n["x"] = { '"_x', desc = "Cut without copy" }

      -- 分屏快捷键
      maps.n["<Leader>w"] = { desc = "󱂬 Window" }
      maps.n["<Leader>ww"] = { "<cmd><cr>", desc = "Save" }
      maps.n["<Leader>wc"] = { "<C-w>c", desc = "Close current screen" }
      maps.n["<Leader>wo"] = { "<C-w>o", desc = "Close other screen" }
      -- 多个窗口之间跳转
      maps.n["<Leader>we"] = { "<C-w>=", desc = "Make all window equal" }

      maps.n["<TAB>"] =
        { function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
      maps.n["<S-TAB>"] = {
        function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      }
      -- maps.n["<Leader>bo"] = maps.n["<Leader>bc"]

      -- lsp restart
      maps.n["<Leader>lm"] = { "<Cmd>LspRestart<CR>", desc = "Lsp restart" }
      maps.n["<Leader>lg"] = { "<Cmd>LspLog<CR>", desc = "Show lsp log" }

      if vim.fn.executable "lazygit" == 1 then
        maps.n["<Leader>tl"] = {
          require("utils").toggle_lazy_git(),
          desc = "ToggleTerm lazygit",
        }
      end

      if vim.fn.executable "lazydocker" == 1 then
        maps.n["<Leader>td"] = {
          require("utils").toggle_lazy_docker(),
          desc = "ToggleTerm lazydocker",
        }
      end

      if vim.fn.executable "unimatrix" == 1 then
        maps.n["<Leader>tm"] = {
          require("utils").toggle_unicmatrix(),
          desc = "ToggleTerm unimatrix",
        }
      end

      if vim.fn.executable "tte" == 1 then
        maps.n["<Leader>te"] = {
          require("utils").toggle_tte(),
          desc = "ToggleTerm tte",
        }
      end
    end
    opts.mappings = maps
  end,
}
