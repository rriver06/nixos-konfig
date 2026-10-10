{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
      package = pkgs.nerd-fonts.jetbrains-mono;
    };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 8;
      background_opacity = "0.94";
      dynamic_background_opacity = true;
    };
  };
}
