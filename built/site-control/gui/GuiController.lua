--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____DrawingContext = require("gui.DrawingContext")
local DrawingContext = ____DrawingContext.default
____exports.default = (function()
    ____exports.default = __TS__Class()
    local GuiController = ____exports.default
    GuiController.name = "GuiController"
    function GuiController.prototype.____constructor(self, gpu)
        self.pages = __TS__New(Map)
        self.context = __TS__New(DrawingContext, gpu)
    end
    function GuiController.prototype.registerPage(self, page)
        self.pages:set(
            page:getName(),
            page
        )
    end
    function GuiController.prototype.handleTouch(self, x, y, player)
        if self.activePage ~= nil then
            local component = self.activePage:findComponentAt(x, y)
            if component ~= nil then
                component:onTouched(x - component.x, y - component.y, player)
            end
        end
    end
    function GuiController.prototype.draw(self)
        if self.activePage ~= nil then
            self.activePage:draw(self.context)
        end
    end
    return GuiController
end)()
return ____exports
