local binds = require("config.binds")
local rules = require("config.rules")
local plugins = require("config.plugins")
local animations = require("config.animations")
local permissions = require("config.permissions")
local theme = require("config.theme")

package.path = package.path .. ";./?.lua;./?/init.lua"

--#region MARK: Monitor config
hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@75",
  position = "1920x0",
  scale = 1
})
hl.monitor({
  output = "DP-1",
  mode = "1920x1080@165",
  position = "0x0",
  scale = 1
})
hl.monitor({
  output = "HDMI-A-2",
  mode = "1920x1080@60",
  position = "-1920x0",
  scale = 1
})
--#endregion

--#region MARK: Permission
for _, permission in ipairs(permissions) do
  hl.permission(permission)
end
--#endregion

--#region MARK: Auto start
hl.on("hyprland.start", function()
  hl.exec_cmd("eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,gpg)")
  hl.exec_cmd("hyprctl setcursor macOS 28")
  hl.exec_cmd("hyprpm reload -n")
  hl.exec_cmd("uwsm app -- wl-paste -t text --watch clipman store --no-persist")
  hl.exec_cmd("uwsm app -- swayosd-server")
  hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme "macOS"')
  hl.exec_cmd('dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP')
end)
--#endregion

--#region MARK: RulesConfig

for _, rule in ipairs(rules.window) do
  hl.window_rule(rule)
end

for _, rule in ipairs(rules.layer) do
  hl.layer_rule(rule)
end

for _, rule in ipairs(rules.workspace) do
  hl.workspace_rule(rule)
end
--#endregion

--#region MARK: Bind
for _, bind in ipairs(binds) do
  local success, err = pcall(hl.bind, bind[1], bind[2], bind[3] or {})

  if not success then
    hl.notification.create({
      text = "Bind Failed: [" .. bind[1] .. "]\nError: " .. err,
      timeout = 10000,
      icon = "error",
      color = "rgba(ff3333ff)"
    })
  end
end
--#endregion

--#region MARK: Plugins init
plugins.setup_swm()
plugins.setup_vkfix()
plugins.setup_dynamic_cursor()
--#endregion

--#region MARK: Config

hl.config({
  general = {
    allow_tearing = true,

    gaps_in = 5,
    gaps_out = 12,
    border_size = 2,

    resize_on_border = false,
    layout = "dwindle",

    snap = {
      enabled = true
    },

    col = {

      active_border = {
        colors = { Rgba(theme.green, "ff") }
      },
      inactive_border = Rgb(theme.base),
    }
  },

  input = {
    kb_layout = "fr",
    repeat_rate = 35,
    repeat_delay = 600,
    numlock_by_default = true,

    follow_mouse = true
  },

  decoration = {
    rounding = 5,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    dim_inactive = false,
    dim_strength = 0.05,
    blur = {
      enabled = true,
      size = 3,
      passes = 1,

      vibrancy = 0.1696,
    },

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },

  misc = {
    disable_hyprland_logo = false,
    force_default_wallpaper = -1
  },

  dwindle = {
    force_split                  = 0,
    preserve_split               = false,
    smart_split                  = false,
    smart_resizing               = true,
    permanent_direction_override = false,
    special_scale_factor         = 1,
    split_width_multiplier       = 1.0,
    use_active_for_splits        = true,
    default_split_ratio          = 1.0,
    split_bias                   = 0,
    precise_mouse_move           = false,
  },
})
--#endregion

--#region MARK: Animations
for _, curve in ipairs(animations.curves) do
  hl.curve(curve.name, {
    type = "bezier",
    points = curve.points
  })
end

for _, animation in ipairs(animations.animations) do
  hl.animation({
    leaf = animation.leaf,
    enabled = animation.enabled,
    speed = animation.speed,
    bezier = animation.bezier,
    style = animation.style
  })
end
--#endregion
