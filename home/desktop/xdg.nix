{ pkgs, ... }:

{
  # Desktop defaults managed by xdg.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;

    config = {
      common = { default = [ "gtk" ]; };
      niri = { default = [ "gtk" ]; };
    };
  };

  # Set some default apps.
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };

}
