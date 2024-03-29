# SSUI Conky

SSUI is a modular conky suite with the minimalistic and clean design in focus.

It consists of following modules:
- Clock
- Spotify
- System
- Weather

Use config file to enable/disable widgets.


# Preview


![alt text](preview.jpg "Preview")


# Requirements

## General requirements 
- conky 1.11 (it may work on older version, but it is not tested)
- lua 5.4 (it may work on older version, but it is not tested)

| Module  | Requirements                            |
| ------  | --------------------------------------- |
| clock   | -                                       |
| spotify | spotify                                 |
| system  | -                                       |
| weather | luajson, openweather api key            |


# Install

SSUI is expected to be installed in `~/.conky/ssui`.

Run `install.sh` (check if you have execution permission) or do it manually (just create copy files there).


# Usage

## Configuration

Before running SSUI you maybe want to configure it.

Update `config.lua`.

```lua
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
```

When configuration is updated SSUI will require restart to take in the effect.


## Running

Run `start.sh`. Simple as that.


## Autostart [Manjaro KDE Example]

You would probably like to start it automatically on startup so here is what you can do.

*Note*: you may need to make some changes to suit yourself.

1. Create desktop file
```bash
nano ~/.config/autostart/ssui-conky.desktop
```

2. Paste this into the file
```
[Desktop Entry]
Comment=Collection of conky widgets
Exec=sleep 10 && ~/.conky/ssui/start.sh > /dev/null 2>&1 &
Icon=conky
Name=SSUI Conky
Terminal=false
TerminalOptions=
Type=Application

```
3. Done


# Changelog

Complete changelog available at [link](CHANGELOG.md).