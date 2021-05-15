--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local GuiComponent = ____exports.default
    GuiComponent.name = "GuiComponent"
    function GuiComponent.prototype.____constructor(self, x, y, width, height)
        self._x = x
        self._y = y
        self._width = width
        self._height = height
        self.dirty = true
    end
    __TS__SetDescriptor(
        GuiComponent.prototype,
        "x",
        {
            get = function(self)
                return self._x
            end,
            set = function(self, value)
                if value ~= self._x then
                    self._x = value
                    self:markDirty()
                end
            end
        },
        true
    )
    __TS__SetDescriptor(
        GuiComponent.prototype,
        "y",
        {
            get = function(self)
                return self._y
            end,
            set = function(self, value)
                if value ~= self._y then
                    self._y = value
                    self:markDirty()
                end
            end
        },
        true
    )
    __TS__SetDescriptor(
        GuiComponent.prototype,
        "width",
        {
            get = function(self)
                return self._width
            end,
            set = function(self, value)
                if value ~= self._width then
                    self._width = value
                    self:markDirty()
                end
            end
        },
        true
    )
    __TS__SetDescriptor(
        GuiComponent.prototype,
        "height",
        {
            get = function(self)
                return self._height
            end,
            set = function(self, value)
                if value ~= self._height then
                    self._height = value
                    self:markDirty()
                end
            end
        },
        true
    )
    function GuiComponent.prototype.markDirty(self)
        self.dirty = true
    end
    function GuiComponent.prototype.draw(self, context)
        self:doDraw(context)
        context:setColors(16777215, 0)
    end
    function GuiComponent.prototype.isDirty(self)
        return self.dirty
    end
    function GuiComponent.prototype.clearDirty(self)
        self.dirty = false
    end
    function GuiComponent.prototype.onTouched(self, x, y, player)
    end
    return GuiComponent
end)()
return ____exports
