--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local FS = require("filesystem")
local Shell = require("shell")
local function getProxy(self, ...)
    local all = {...}
    return all[1]
end
local proxy = getProxy(nil, ...)
FS.mount(proxy, "/home")
Shell.setWorkingDirectory("//home")
Shell.execute("site-control.bin")
return ____exports
