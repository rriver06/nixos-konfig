{ pkgs, ... }:

{

  stylix = {
    enable = true;

    # Fallback image.
    image = ./wallpapers/default.jpg;

    # Preferred polarity (dark or light)
    polarity = "dark";

    # Fonts (Apply Nerd fonts globally)
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        terminal = 12;
        desktop = 12;
      };
    };

    # Cursor
    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
      size = 24;
    };

  };

}
