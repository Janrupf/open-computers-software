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
    function Button.prototype.____constructor(self, x, y, width, text, callback)
        GuiComponent.prototype.____constructor(self, x, y, width, 3)
        self.text = text
        self.callback = callback
        self.active = false
    end
    function Button.prototype.doDraw(self, context)
        if self.active then
            context:setColors(16777215, 14483456)
        else
            context:setColors(16777215, 65280)
        end
        context:rect(self.x, self.y, self.width, self.height)
        local startX = ((self.width / 2) - (#self.text / 2)) + self.x
        context:write(startX, self.y + 1, self.text)
    end
    function Button.prototype.setText(self, text)
        self.text = text
        self:markDirty()
    end
    function Button.prototype.onTouched(self, x, y, player)
        self.active = true
        self:callback(self, player)
        self:markDirty()
    end
    return Button
end)()
return ____exports
