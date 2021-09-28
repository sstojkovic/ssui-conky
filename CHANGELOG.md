# Changelog

# v1.2.0 [2021-09-28]

## Added customization

- Text color
- Font family

# v1.1.0 [2020-12-13]

## Added **weather** module

- Positioned above the clock module
- Provides current temperature and basic description
- Temperature unit is customizable in *config.lua*
- Uses [https://openweathermap.org/api](https://openweathermap.org/api)

## Changed config.lua format

Enabled modules are presented as a list: 
```lua
modules = {'clock', 'system', 'spotify', 'weather'}
```


# v1.0.0 [2020-12-02]

## Initial released version

Implemented modules:
- Clock (displays current date and time)
- Spotify (displays current playing song and artist name)
- System (displays basic system info: cpu, ram, disk usage)