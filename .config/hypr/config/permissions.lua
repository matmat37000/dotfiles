---@type HL.PermissionSpec[]
local permissions = {
    {
        binary = "/usr/(bin|local/bin)/grim",
        type = "screencopy",
        mode = "allow"
    },

    {
        binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",
        type = "screencopy",
        mode = "allow"
    },

    {
        binary = "/usr/(bin|local/bin)/hyprpm",
        type = "plugin",
        mode = "allow"
    }
}

return permissions