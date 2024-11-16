local overseer = require "overseer"
local cmake = require "cmake-tools"

return {
  -- Required fields
  name = "run",
  builder = function()
    local env_file = cmake.get_build_directory()
      .. "/conan/build/"
      .. cmake.get_build_type()
      .. "/generators/conanrun.sh"
    local useConan = require("utils").detect_files_in_paths({ "conanfile.py", "conanfile.txt" }, { vim.fn.getcwd() })

    local target = cmake.get_launch_target_path()
    local launch_args = cmake.get_launch_args()
    local args = { "-c", target .. " " .. table.concat(launch_args, " ") }
    if useConan then
      args = { "-c", "source " .. env_file .. " && " .. target .. " " .. table.concat(launch_args, " ") }
    end
    --- @type overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = { "bash" },
      -- additional arguments for the cmd
      args = args,
      -- the name of the task (defaults to the cmd of the task)
      name = "run",
      -- the list of components or component aliases to add to the task
      components = {
        "default",
      },
    }
  end,
  -- Optional fields
  desc = "Run selected target",
  -- Tags can be used in overseer.run_template()
  tags = { overseer.TAG.RUN },
  params = {
    -- See :help overseer-params
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 50,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    -- Arbitrary logic for determining if task is available
    callback = function() return cmake.is_cmake_project() end,
  },
}
