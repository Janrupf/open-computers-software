--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GuiComponent = require("gui.component.GuiComponent")
local GuiComponent = ____GuiComponent.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Label = ____exports.default
    Label.name = "Label"
    __TS__ClassExtends(Label, GuiComponent)
    function Label.prototype.____constructor(self, x, y, text)
        GuiComponent.prototype.____constructor(self, x, y, #text, 1)
        self.text = text
    end
    function Label.prototype.setText(self, text)
        self.text = text
        self:markDirty()
    end
    function Label.prototype.doDraw(self, context)
        context:write(self.x, self.y, self.text)
    end
    return Label
end)()
return ____exports
