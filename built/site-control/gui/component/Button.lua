--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GuiComponent = require("gui.component.GuiComponent")
local GuiComponent = ____GuiComponent.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Button = ____exports.default
    Button.name = "Button"
    __TS__ClassExtends(Button, GuiComponent)
    function Button.prototype.____constructor(self, x, y, text, callback)
        GuiComponent.prototype.____constructor(self, x, y, #text + 2, 3)
        self.text = text
        self.callback = callback
    end
    function Button.prototype.doDraw(self, context)
        context:setColors(0, 65280)
        context:rect(self.x, self.y, self.width, self.height)
        context:setColors(16777215, 65280)
        context:write(self.x + 1, self.y + 1, self.text)
    end
    function Button.prototype.setText(self, text)
        self.text = text
        self.width = #text + 2
        self:markDirty()
    end
    function Button.prototype.onTouched(self, x, y, player)
        self:callback(self, player)
    end
    return Button
end)()
return ____exports
