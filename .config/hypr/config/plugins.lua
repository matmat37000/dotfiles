local vars = require("config.vars")

local Plugins = {}

-- MARK: Split Monitor Workspaces
function Plugins.setup_swm()
  local status, smw = pcall(require, "plugins.split-monitor-workspaces")
  if status then
    smw.setup({
      workspace_count = 5, -- This will create 5 persistent workspaces on each monitor at startup
    })

    for i = 1, smw.get_amount_of_workspaces() do
      local n = tostring(i)
      hl.bind(vars.MainMod .. " + code:" .. 9 + i, smw.workspace(n))
      -- Move the active window to the Nth workspace on the currently focused monitor silently (no focus change).
      hl.bind(vars.MainMod .. " + SHIFT + code:" .. 9 + i, smw.move_to_workspace_silent(n))
    end

    hl.bind(vars.MainMod .. " + mouse_down", smw.cycle_workspaces("prev"))
    hl.bind(vars.MainMod .. " + mouse_up", smw.cycle_workspaces("next"))
  end
end

-- MARK: CSGO Vulkan Fix
function Plugins.setup_vkfix()
  if hl.plugin.csgo_vulkan_fix ~= nil then
    hl.config({
      plugin = {
        csgo_vulkan_fix = {
          fix_mouse = true
        }
      }
    })
  end
end

-- MARK: Dynamic Cursor
-- https://github.com/VirtCode/hypr-dynamic-cursors#configuration
function Plugins.setup_dynamic_cursor()
  if hl.plugin.dynamic_cursors ~= nil then
    hl.config({
      plugin = {
        dynamic_cursors = {
          enabled = true,
          mode = "none",

          hyprcursor = {
            nearest = 1,
            enabled = true,
            resolution = -1,
            fallback = "clientside",
          }
        }
      }
    })
  end
end

---@type HL._Plugins
return Plugins
