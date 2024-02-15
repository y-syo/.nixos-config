{ config, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      enable_audio_bell no
      window_padding_width	10
      window_padding_height	10
      tab_bar_min_tabs		1
      tab_bar_edge		bottom
      tab_bar_style		powerline
      tab_powerline_style	slanted
      tab_title_template	{title}{" :{}:".format(num_windows) if num_windows > 1 else ""}
    '';
  };
}
