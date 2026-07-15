---@type HL.WindowRuleSpec[]
local window_rules = {
    -- Main
    {
        match = {
            class = ".*"
        },
        suppress_event = "maximize"
    },

    -- Blacklist
    {
        match = {
            initial_title = "^(vesktop|Discord)$"
        },
        tag = "+hidden"
    },

    {
        match = {
            initial_class = "^(org.gnome.Nautilus)$",
            title = "^(Sus|Perso)$"
        },
        no_screen_share = true
    },

    {
        match = {
            initial_class = "^(imv)$",
            title = "^(.*/home/mathiol/Pictures/Saved/Sus/.*)$"
        },
        no_screen_share = true
    },

    {
        match = {
            initial_class = "^(zen)$",
            title = "^(Locked Folder - Immich.*)$"
        },
        no_screen_share = true
    },

    {
        match = {
            initial_class = "^(zen)$",
            title = "^(.*Private Browsing)$"
        },
        tag = "+hidden"
    },

    {
        name = "hide-from-recording",
        match = {
            tag = "hidden"
        },
        no_screen_share = true
    },


    -- Fix some dragging issues with XWayland
    {
        name = "fix-dragging",
        match = {
            class = "^$",
            title = "^$",
            fullscreen = false,
            float = true,
            pin = false,
            xwayland = true
        },
        no_focus = true
    },


    -- File picker
    {
        name = "file-picker",
        match = {
            initial_class = "^(xdg-desktop-portal-gtk)$"
        },
        float = true,
        center = true,
        size = "1200 800",
        dim_around = true
    },


    -- Clip Paint Studio
    {
        name = "csp",
        match = {
            initial_class = "^(explorer.exe)$",
            title = "^Wine Desktop$"
        },
        fullscreen = true,
        monitor = "DP-1",
        workspace = "10 silent"
    },


    -- Steam
    {
        match = {
            title = "^(Steam)$"
        },
        tag = "+steamapps"
    },

    {
        match = {
            title = "^(Steam .*)$"
        },
        center = true
    },

    {
        match = {
            class = "^(steam)$",
            title = "^(Friends List|Steam)$"
        },
        workspace = "special:steam"
    },

    {
        match = {
            class = "^(steam)$",
            title = "^(Friends List)$"
        },
        size = "<420 100%"
    },

    {
        name = "SteamApps",
        match = {
            tag = "steamapps"
        },
        tile = true
    },


    -- Picture-in-Picture
    {
        name = "Picture-in-Picture",
        match = {
            class = "^(zen)$",
            title = "^(Picture-in-Picture)$"
        },
        float = true,
        pin = true,
        keep_aspect_ratio = true,
        render_unfocused = true
    },


    -- Games
    {
        match = {
            class = "cs2"
        },
        immediate = true
    },

    {
        name = "gamescope",
        match = {
            class = "^(gamescope)$"
        },
        immediate = true,
        fullscreen = true
    },


    -- Clip Studio Paint
    {
        match = {
            class = "^(clipstudiopaint.exe)$"
        },
        tile = true
    },

    {
        name = "clipstudiopaint-popup",
        match = {
            class = "^(clipstudiopaint.exe)$",
            float = true
        },
        stay_focused = true,
        allows_input = true,
        float = true,
        no_shadow = true,
        border_size = 0,
        animation = "no"
    },


    -- Minecraft
    {
        name = "Minecraft",
        match = {
            initial_class = "^(Minecraft.*)$"
        },
        float = true,
        center = true
    },


    -- Godot Engine
    {
        name = "godot",
        match = {
            initial_class = "^(Godot)$",
            initial_title = "^(Godot)$"
        },
        tile = true
    },


    -- Steam Big Picture Mode
    {
        match = {
            initial_title = "^(Steam Big Picture Mode)$",
            initial_class = "^(steam)$"
        },
        tile = true
    },


    -- Tearing
    {
        name = "Tearing",
        match = {
            initial_class = "^(steam_app_(.*))$"
        },
        immediate = true,
        fullscreen = true
    }
}

---@type HL.LayerRuleSpec[]
local layer_rules = {
    -- Blur - Waybar
    {
        name = "waybar",
        match = {
            namespace = "waybar"
        },
        blur = true,
        ignore_alpha = 0.5
    },


    -- Blur - Swaync
    {
        name = "swaync",
        match = {
            namespace = "^(swaync-control-center|swaync-notification-window)$"
        },
        blur = true,
        ignore_alpha = 0.5
    },


    -- Blur - rofi
    {
        name = "rofi",
        match = {
            namespace = "rofi"
        },
        blur = true,
        ignore_alpha = 0.5
    }
}

---@type HL.WorkspaceRuleSpec[]
local workspace_rules = {
    {
        workspace = "special:steam",
        no_shadow = true,
        on_created_empty = 'notify-send -t 1000 "Launching Steam..." && gtk-launch steam'
    }
}

---@type HL._RulesConfig
return {
    window = window_rules,
    layer = layer_rules,
    workspace = workspace_rules
}
