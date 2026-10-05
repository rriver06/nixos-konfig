{ ... }:

{
  programs.swaylock = {
    enable = true;

    settings = {
      color = "1e1e2e";
      font = "JetBrainsMono Nerd Font";
      font-size = 22;
      indicator-radius = 110;
      indicator-thickness = 8;
      ring-color = "89b4fa";
      key-hl-color = "a6e3a1";
      inside-color = "1e1e2ecc";
      inside-clear-color = "1e1e2ecc";
      inside-ver-color = "1e1e2ecc";
      inside-wrong-color = "1e1e2ecc";
      text-color = "cdd6f4";
      text-clear-color = "f9e2af";
      text-ver-color = "89b4fa";
      text-wrong-color = "f38ba8";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      separator-color = "00000000";
      show-failed-attempts = true;
      clock = true;
      timestr = "%H:%M";
      datestr = "%A, %d de %B";
    };
  };

}
