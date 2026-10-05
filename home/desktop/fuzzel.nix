{ ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        terminal = "kitty";
        layer = "overlay";
        width = 45;
        lines = 12;
        horizontal-pad = 24;
        vertical-pad = 18;
        inner-pad = 10;
        prompt = "> ";
        icon-theme = "Papirus-Dark";
        show-actions = "yes";
      };

      border = {
        width = 2;
        radius = 16;
      };

      colors = {
        # background = "1e1e2eff";
        # text = "cdd6f4ff";
        # match = "89b4faff";
        # selection = "313244ff";
        # selection-text = "cdd6f4ff";
        # selection-match = "89b4faff";
        # border = "89b4faff";
      };

    };
  };
}
