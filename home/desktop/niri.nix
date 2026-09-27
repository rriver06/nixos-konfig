{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri = {
    settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];

      binds = {
        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+Alt+L".action.spawn = "swaylock";
      };

    };
  };

  # Config method if programs.niri doesn't exists
  # xdg.configFile."niri/config.kdl".text = ''
  #   spawn-at-startup "noctalia"
  #
  #   binds {
  #     Mod+Return { spawn "kitty"; }
  #     Mod+D { spawn = "fuzzel"; }
  #     Mod+Alt+L { spawn = "swaylock"; }
  #   }
  # '';

}
