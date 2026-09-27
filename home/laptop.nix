{ config, pkgs, ... }:

{
  imports = [
    # System utils configurations.
    ./utils/terminal/terminal.nix
    ./utils/terminal/fish.nix
    ./utils/terminal/starship.nix
    ./utils/git.nix
    ./utils/fzf.nix
    ./utils/zoxide.nix
    ./utils/bat.nix
    ./utils/delta.nix
    ./utils/ssh.nix

    # App settings.
    ./apps/nvf.nix

    # AppImage settings.
    # ./apps/appimages/appimage-template.nix

    # Theme settings.
    ./themes/cursor.nix

    # Desktop settings.
    ./desktop/noctalia.nix
  ];

  home = {
    # Make sure to check the username
    username = "rriver06";
    homeDirectory = "/home/rriver06";

    # Packages installed for this user.
    packages = with pkgs; [
      # ---------------- Desktop / WM -----------------

      kitty                   # Graphical terminal.


      # ---------------- System Tools -----------------

      nautilus                # GNOME's file manager.
      pavucontrol             # Volume manager.
      blueman                 # Bluetooth manager.
      networkmanagerapplet    # WiFi GUI for NetworkManager.

      # ------------- Wayland Components --------------

      polkit_gnome            # Floating password prompt.
      libnotify               # Notifications graphic engine.
    ];

    # Make sure this version is the same as the one in the main configuration.nix
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
