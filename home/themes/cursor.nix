{ pkgs, ... }:

{
  home.pointerCursor = {

    enable = true;
    x11.enable = true;
    gtk.enable = true;

    # Managed by stylix.
    # size = 24;
    # name = "Adwaita";
    # package = pkgs.adwaita-icon-theme;

  };
}
