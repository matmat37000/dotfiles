---@class HL._Vars.Main
---@field Terminal string
---@field FileManager string
---@field ColorPicker string
---@field Menu string
---@field Emoji string
---@field Key string
---@field ClipboardManager string
---@field MainMod string

---@class HL._BindSpec
---@field [1] string Bind key
---@field [2] function|HL.Dispatcher Callback/action
---@field [3] HL.BindOptions? Options

---@class HL._RulesConfig
---@field window HL.WindowRuleSpec[]
---@field layer HL.LayerRuleSpec[]
---@field workspace HL.WorkspaceRuleSpec[]

---@class HL._Plugins
---@field init_swm fun(): nil
---@field setup_vkfix fun(): nil
---@field setup_dynamic_cursor fun(): nil

---@class HL._AnimationSpec
---@field leaf string
---@field enabled boolean
---@field speed number
---@field bezier string
---@field style? string

---@class HL._Curve
---@field name string
---@field points number[][]
