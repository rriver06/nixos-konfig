{ pkgs, ... }:

{
  # Desktop defaults managed by xdg.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    xdgOpenUsePortal = true;

    config = {
      common = { default = [ "gnome" "gtk" ]; };
      niri = { default = [ "gnome" "gtk" ]; };
    };
  };
}
