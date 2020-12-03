local config = require "config"

local function start(name)
  io.popen("conky -c ~/.conky/ssui/modules/"..name.."/"..name..".lua")
end

if config.clock then start("clock") end
if config.spotify then start("spotify") end
if config.system then start("system") end

