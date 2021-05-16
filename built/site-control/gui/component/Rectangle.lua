--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GuiComponent = require("gui.component.GuiComponent")
local GuiComponent = ____GuiComponent.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Rectangle = ____exports.default
    Rectangle.name = "Rectangle"
    __TS__ClassExtends(Rectangle, GuiComponent)
    function Rectangle.prototype.____constructor(self, x, y, width, height)
        GuiComponent.prototype.____constructor(self, x, y, width, height)
        self.background = 187
    end
    function Rectangle.prototype.setBackground(self, value)
        self.background = value
    end
    function Rectangle.prototype.doDraw(self, context)
        context:setColors(16777215, self.background)
        context:rect(self.x, self.y, self.width, self.height)
    end
    return Rectangle
end)()
return ____exports
