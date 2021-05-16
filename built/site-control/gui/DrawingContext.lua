--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.default = (function()
    ____exports.default = __TS__Class()
    local DrawingContext = ____exports.default
    DrawingContext.name = "DrawingContext"
    function DrawingContext.prototype.____constructor(self, gpu)
        self.gpu = gpu
    end
    function DrawingContext.prototype.setColors(self, foreground, background)
        self.gpu.setForeground(foreground, false)
        self.gpu.setBackground(background, false)
    end
    function DrawingContext.prototype.write(self, x, y, text)
        self.gpu.set(x, y, text)
    end
    function DrawingContext.prototype.rect(self, x, y, width, height, fill)
        if fill == nil then
            fill = " "
        end
        self.gpu.fill(
            x,
            y,
            self:substituteWidth(width),
            self:substituteHeight(height),
            fill
        )
    end
    function DrawingContext.prototype.clearScreen(self)
        local width, height = self.gpu.getViewport()
        self:rect(0, 0, width, height)
    end
    function DrawingContext.prototype.substituteWidth(self, x)
        return ((x == -1) and ({
            self.gpu.getViewport()
        })[1]) or x
    end
    function DrawingContext.prototype.substituteHeight(self, y)
        return ((y == -1) and ({
            self.gpu.getViewport()
        })[2]) or y
    end
    return DrawingContext
end)()
return ____exports
