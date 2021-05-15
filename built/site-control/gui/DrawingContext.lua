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
        self.gpu.fill(x, y, width, height, fill)
    end
    return DrawingContext
end)()
return ____exports
