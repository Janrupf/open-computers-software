--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local Component = require("component")
local Event = require("event")
local ____GuiController = require("gui.GuiController")
local GuiController = ____GuiController.default
local ____Page = require("gui.Page")
local Page = ____Page.default
local ____Button = require("gui.component.Button")
local Button = ____Button.default
print("SiteControl version 1.0.0 starting up!")
if not Component.gpu then
    error(
        __TS__New(Error, "SiteControl requires a GPU!"),
        0
    )
end
local controller = __TS__New(GuiController, Component.gpu)
local testPage = __TS__New(Page, "test")
testPage:add(
    __TS__New(
        Button,
        4,
        4,
        "Click me!",
        function(____, button, player)
            button:setText("Clicked by " .. player)
        end
    )
)
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
        local ____switch7 = event
        if ____switch7 == "tickProgram" then
            goto ____switch7_case_0
        elseif ____switch7 == "touch" then
            goto ____switch7_case_1
        elseif ____switch7 == "interrupted" then
            goto ____switch7_case_2
        end
        goto ____switch7_end
        ::____switch7_case_0::
        do
            do
                controller:draw()
                goto ____switch7_end
            end
        end
        ::____switch7_case_1::
        do
            do
                controller:handleTouch(data[1], data[2], data[3])
                controller:draw()
                goto ____switch7_end
            end
        end
        ::____switch7_case_2::
        do
            do
                return true
            end
        end
        ::____switch7_end::
        return false
    end)(nil)
    if terminateLoop then
        break
    end
end
Event.cancel(timerId)
return ____exports
