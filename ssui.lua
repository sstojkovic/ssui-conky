local config = require "config"

local function start(name)
  io.popen("conky -c ~/.conky/ssui/modules/"..name.."/"..name..".lua")
end

for _, module in pairs(config.modules) do
  start(module)
end