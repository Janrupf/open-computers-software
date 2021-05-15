--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local Page = ____exports.default
    Page.name = "Page"
    function Page.prototype.____constructor(self, name)
        self.name = name
        self.components = {}
    end
    function Page.prototype.add(self, component)
        __TS__ArrayPush(self.components, component)
    end
    function Page.prototype.findComponentAt(self, x, y)
        do
            local i = #self.components - 1
            while i >= 0 do
                local checkingComponent = self.components[i + 1]
                if ____exports.default:isPointInRect(checkingComponent.x, checkingComponent.y, checkingComponent.width, checkingComponent.height, x, y) then
                    return checkingComponent
                end
                i = i - 1
            end
        end
        return nil
    end
    function Page.prototype.getName(self)
        return self.name
    end
    function Page.prototype.draw(self, context)
        for ____, component in ipairs(self.components) do
            if component:isDirty() then
                component:draw(context)
                component:clearDirty()
            end
        end
    end
    function Page.prototype.isDirty(self)
        return __TS__ArraySome(
            self.components,
            function(____, c) return c:isDirty() end
        )
    end
    function Page.isPointInRect(self, rectX, rectY, rectWidth, rectHeight, pointX, pointY)
        return (((rectX >= pointX) and (pointX <= (rectX + rectWidth))) and (rectY >= pointY)) and (pointY <= (rectY + rectHeight))
    end
    return Page
end)()
return ____exports
