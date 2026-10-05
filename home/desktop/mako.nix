{ ... }:

{
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-right";
      default-timeout = 7000;
      ignore-timeout = false;
      max-visible = 5;
      width = 380;
      height = 160;
      margin = "15";
      padding = "15";
      border-size = 2;
      border-radius = 16;
      font = "JetBrainsMono Nerd Font 11";
      background-color = "#1e1e2eee";
      text-color = "#cdd6f4ff";
      border-color = "#89b4faff";
      progress-color = "over #313244";
      icons = true;
      markup = true;
      actions = true;
      format = "<b>%s</b>\n%b";
    };

    extraConfig = ''
      [urgency=low]
      border-color=#89b4fa
      default-timeout=4000

      [urgency=normal]
      border-color=#a6e3a1
      default-timeout=7000

      [urgency=high]
      border-color=#f38ba8
      default-timeout=0
    '';
  };

}
