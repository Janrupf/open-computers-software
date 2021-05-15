--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local Component = require("component")
local Event = require("event")
local ____GuiController = require("gui.GuiController")
local GuiController = ____GuiController.default
print("SiteControl version 1.0.0 starting up!")
if not Component.gpu then
    error(
        __TS__New(Error, "SiteControl requires a GPU!"),
        0
    )
end
local controller = __TS__New(GuiController, Component.gpu)
local function tickTimer(self)
    Event.push("tickProgram")
end
local timerId = Event.timer(0.2, tickTimer, math.huge)
while true do
    local ____ = {
        Event.pullMultiple("touch", "interrupted", "tickProgram")
    }
    local event = ____[1]
    local data = __TS__ArraySlice(____, 1)
    local terminateLoop = (function()
        local ____switch6 = event
        if ____switch6 == "tickProgram" then
            goto ____switch6_case_0
        elseif ____switch6 == "touch" then
            goto ____switch6_case_1
        elseif ____switch6 == "interrupted" then
            goto ____switch6_case_2
        end
        goto ____switch6_end
        ::____switch6_case_0::
        do
            do
                controller:draw()
                goto ____switch6_end
            end
        end
        ::____switch6_case_1::
        do
            do
                controller:handleTouch(data[1], data[2], data[3])
                controller:draw()
                goto ____switch6_end
            end
        end
        ::____switch6_case_2::
        do
            do
                return true
            end
        end
        ::____switch6_end::
        return false
    end)(nil)
    if terminateLoop then
        break
    end
end
Event.cancel(timerId)
return ____exports
