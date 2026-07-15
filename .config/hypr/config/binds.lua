local vars = require("config.vars")

local function exec(app)
  return hl.dsp.exec_cmd("uwsm app -- " .. app)
end

local function __(...)
  local keys = { ... }
  local separator = " + "
  local out = ""
  for i, key in ipairs(keys) do
    out = out .. key
    if i < #keys then
      out = out .. separator
    end
  end

  return out
end

---@type HL._BindSpec[]
return {
  --#region MARK: Main
  { __(vars.MainMod, "C"),            hl.dsp.window.close() },
  { __(vars.MainMod, "SHIFT", "C"),   hl.dsp.window.kill() },
  { __(vars.MainMod, "V"),            hl.dsp.window.float() },
  { __(vars.MainMod, "F"),            hl.dsp.window.fullscreen({ action = "toggle" }) },
  { __(vars.MainMod, "P"),            hl.dsp.window.pseudo() },
  { __(vars.MainMod, "M"),            hl.dsp.exec_cmd('uwsm stop') },
  { __(vars.MainMod, "L"),            hl.dsp.exec_cmd('loginctl lock-session') },
  --#endregion

  --#region MARK: Apps
  { __(vars.MainMod, "RETURN"),       exec(vars.Terminal) },
  { __(vars.MainMod, "E"),            exec(vars.FileManager) },
  { __(vars.MainMod, "I"),            exec(vars.ColorPicker) },
  { __(vars.MainMod, "SPACE"),        exec(vars.Menu) },
  { __(vars.MainMod, "code:59"),      exec(vars.Emoji) },
  { __(vars.MainMod, "X"),            exec(vars.ClipboardManager) },
  { __(vars.MainMod, "N"),            exec("swaync-client -t -sw") },
  --#endregion

  --#region MARK: Focus
  { __(vars.MainMod, "LEFT"),         hl.dsp.focus({ direction = 'l' }) },
  { __(vars.MainMod, "RIGHT"),        hl.dsp.focus({ direction = 'r' }) },
  { __(vars.MainMod, "UP"),           hl.dsp.focus({ direction = 'u' }) },
  { __(vars.MainMod, "RIGHT"),        hl.dsp.focus({ direction = 'r' }) },
  { __(vars.MainMod, "DOWN"),         hl.dsp.focus({ direction = 'd' }) },
  --#endregion

  --#region MARK: Move / Resize
  { __(vars.MainMod, "mouse:272"),    hl.dsp.window.drag() },
  { __(vars.MainMod, "mouse:273"),    hl.dsp.window.resize() },
  --#endregion

  --#region MARK: Special workspaces
  { __(vars.MainMod, "S"),            hl.dsp.workspace.toggle_special("steam") },
  { __(vars.MainMod, "TAB"),          hl.dsp.workspace.toggle_special("magic") },
  { __(vars.MainMod, "SHIFT", "TAB"), hl.dsp.window.move({ workspace = "special:magic" }) },
  --#endregion

  --#region MARK: Screenshot
  { __(vars.MainMod, "SHIFT", "S"),   exec('hyprcap shot region -z -q -w -c -A -o "$HYRPSHOT_DIR"'),        { locked = true } },
  { __(vars.MainMod, "PRINT"),        exec('hyprcap shot window:active -z -q -w -c -A -o "$HYRPSHOT_DIR"'), { locked = true } },
  --#endregion

  --#region MARK: Media
  { "XF86AudioRaiseVolume",           hl.dsp.exec_cmd("swayosd-client --output-volume raise"),              { repeating = true } },
  { "XF86AudioLowerVolume",           hl.dsp.exec_cmd("swayosd-client --output-volume lower"),              { repeating = true } },
  { "XF86AudioMute",                  hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),        { locked = true } },
  -- Requires playerctl
  { "XF86AudioPlay",                  hl.dsp.exec_cmd("playerctl play-pause"),                              { locked = true } },
  { "XF86AudioPrev",                  hl.dsp.exec_cmd("playerctl previous"),                                { locked = true } },
  { "XF86AudioNext",                  hl.dsp.exec_cmd("playerctl next"),                                    { locked = true } },
  -- Requires hyprsunset
  { "XF86MonBrightnessDown",          hl.dsp.exec_cmd("hyprctl hyprsunset gamma -10") },
  { "XF86MonBrightnessUp",            hl.dsp.exec_cmd("hyprctl hyprsunset gamma +10") },
  --#endregion
}
