return {
  modules = {'clock', 'system', 'spotify', 'weather'}, -- list of enabled modules
  color = '#2C3E50', -- hex value for text color
  font = 'Roboto', -- name of font (it should be installed on your system)
  weather = { -- options for weather module
    api_key = '<API_KEY>', -- from https://openweathermap.org/api
    city_id = '<CITY_ID>' -- from https://openweathermap.org/api,
    unit = '<UNIT_OF_MEASURE>' -- <metric | imperial>
  }
}