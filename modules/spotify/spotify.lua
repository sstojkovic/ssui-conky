core = require('../../core');
config = require('../../config');

conky.config = {
  alignment = 'top_right',
  background = false,
  border_width = 5,
  cpu_avg_samples = 2,
  default_color = '#ffffff',
  default_outline_color = '#000000',
  default_shade_color = '#000000',
  double_buffer = true,
  draw_borders = false,
  draw_graph_borders = false,
  draw_outline = false,
  draw_shades = false,
  gap_x = 60,
  gap_y = 285,
  max_user_text = 10000,
  maximum_width = 900,
  net_avg_samples = 2,
  no_buffers = true,
  override_utf8_locale = true,
  own_window = true,
  own_window_colour = '#000000',
  own_window_transparent = true,
  own_window_type = 'normal',
  own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
  pad_percents = 2,
  short_units = true,
  stippled_borders = 3,
  text_buffer_size = 8000,
  total_run_times = 0,
  update_interval = 2.0,
  uppercase = false,
  use_spacer = 'right',
  use_xft = true,
  xftalpha = 1,
  own_window_argb_value = 0,
  own_window_argb_visual = true
}

conky.text = interp([[
  ${if_running spotify}
  ${color #{color}}
  $alignr${font #{font}:bold} ___
  $alignr${font #{font}:bold:size=22}${exec modules/spotify/scripts/artist.sh}
  $alignr${font #{font}:light:size=20}${exec modules/spotify/scripts/title.sh}
  ${endif}
]], {color = config.color, font = config.font});
