#!/usr/bin/lua

-- Original script source: https://gist.github.com/meskarune/5729e8d6c8428e9c70a72bed475db4e1

json = require("json")
config = require("config")

api_url = "http://api.openweathermap.org/data/2.5/weather?"

-- http://openweathermap.org/help/city_list.txt , http://openweathermap.org/find
city_id = config.weather.city_id

-- metric or imperial
cf = config.weather.unit

-- get an open weather map api key: http://openweathermap.org/appid
api_key = config.weather.api_key

-- measure is °C if metric and °F if imperial
measure = '°' .. (cf == 'metric' and 'C' or 'F')

cache_file = "weather.json"

currenttime = os.date("!%Y%m%d%H%M%S")

file_exists = function (name)
    f=io.open(name,"r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

if file_exists(cache_file) then
    cache = io.open(cache_file,"r+")
    data = json.decode(cache:read())
    timepassed = os.difftime(currenttime, data.timestamp)
else
    cache = io.open(cache_file, "w")
    timepassed = 6000
end

makecache = function (s)
    s.timestamp = currenttime
    save = json.encode(s)
    cache:write(save)
end

capture = function(cmd, raw)
    local handle = assert(io.popen(cmd, 'r'))
    local output = assert(handle:read('*a'))
    
    handle:close()
    
    if raw then 
        return output 
    end
   
    output = string.gsub(
        string.gsub(
            string.gsub(output, '^%s+', ''), 
            '%s+$', 
            ''
        ), 
        '[\n\r]+',
        ' '
    )
   
   return output
end

if timepassed < 3600 then
    response = data
else
    weather = capture(string.format("curl -L \'%sid=%s&units=%s&APPID=%s\'", api_url, city_id, cf, api_key))
    if weather then
        response = json.decode(weather)
        makecache(response)
    else
        response = data
    end
end

math.round = function (n)
    return math.floor(n + 0.5)
end

temp = response.main.temp
conditions = response.weather[1].main
icon = response.weather[1].icon:sub(1, 2)

io.write(("${color %s}${font %s:size=18}%s%s ${font}| %s\n"):format(config.color, config.font, math.round(temp), measure, conditions))

cache:close()