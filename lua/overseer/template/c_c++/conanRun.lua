local overseer = require "overseer"
local cmake = require "cmake-tools"
local env_file = cmake.get_build_directory() .. "/conan/build/" .. cmake.get_build_type() .. "/generators/conanrun.sh"
print(env_file)

return {
  -- Required fields
  name = "conanRun",
  builder = function()
    local target = cmake.get_launch_target_path()
    local launch_args = cmake.get_launch_args()
    --- @type overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = { "bash" },
      -- additional arguments for the cmd
      args = { "-c", "source " .. env_file .. " && " .. target .. " " .. table.concat(launch_args, " ") },
      -- the name of the task (defaults to the cmd of the task)
      name = "conanRun",
      -- the list of components or component aliases to add to the task
      components = {
        "default",
      },
      -- arbitrary table of data for your own personal use
    }
  end,
  -- Optional fields
  desc = "Run target",
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
