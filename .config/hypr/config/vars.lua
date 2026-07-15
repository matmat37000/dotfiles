---@type HL._Vars.Main
return {
    Terminal = 'kitty',
    FileManager = 'nautilus',
    ColorPicker = 'bash -c "hyprpicker | wl-copy"',
    Menu = 'rofi -show drun -run-command "uwsm app -- {cmd}"',
    Emoji = 'rofi -matching regex -modi emoji -show emoji -kb-secondary-copy "" -kb-custom-1 Ctrl+c',
    Key = 'tab',
    ClipboardManager = 'clipman pick -t rofi',
    MainMod = 'SUPER'
}
