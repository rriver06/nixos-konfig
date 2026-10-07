{ config, pkgs, inputs, ... }:

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
    ./utils/kitty.nix

    # App settings.
    ./apps/nvf.nix
    ./apps/wine.nix

    # AppImage settings.
    # ./apps/appimages/appimage-template.nix

    # Theme settings.
    ./themes/cursor.nix

    # Desktop settings.
    ./desktop/noctalia.nix
    ./desktop/niri.nix
    ./desktop/fuzzel.nix
    ./desktop/xdg.nix
  ];

  home = {
    # Make sure to check the username
    username = "rriver06";
    homeDirectory = "/home/rriver06";

    # Packages installed for this user.
    packages = with pkgs; [
      # ------------------ Internet -------------------

      # Zen Browser
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default


      # ---------------- Windows Apps -----------------

      wineWow64Packages.staging # Wine program.
      winetricks                # GUI for Wine settings.
      bottles                   # Helper app for wine management.


      # ---------------- Desktop / WM -----------------

      kitty                     # Graphical terminal.
      fuzzel                    # Minimalistic app launcher.
      niri                      # Niri tiling WM.
      # Future packages for when i stop using noctalia.
      # waybar                      Configurable taskbar.
      # swaybg                      Wallpaper setup.
      # swww                        Another wallpaper setter.
      # mako                        Notification daemon.
      wl-clipboard              # Clipboard support.
      cliphist                  # Clipboard history manager.
      # swayidle                    
      wlogout                   # Poweroff menu.
      grim                      # Screenshot manager.
      slurp                     # Select screenshot area.
      wf-recorder               # Screen recorder.
      imv                       # Image viewer (provisional).
      evince                    # Document viewer.
      swappy                    # Screenshot editor.


      # ---------------- System Tools -----------------

      brightnessctl             # Brightness control tool.
      playerctl                 # Media player control tool.
      nautilus                  # GNOME's file manager.
      gvfs                      # GNOME's libraries for file manager.
      tumbler                   # Miniature generator for file manager.
      file-roller               # File selector.
      pavucontrol               # Volume manager.
      pamixer                   # Audio utility.
      blueman                   # Bluetooth manager.
      networkmanagerapplet      # WiFi GUI for NetworkManager.
      wlrctl                    # Other tool set.
      wlr-randr                 # Control monitors.
      wl-mirror                 # Allow monitor mirroring.
      jq                        # Automatization tool.
      xdg-desktop-portal-gtk    # GTK portal for XDG.
      xdg-desktop-portal-gnome  # Gnome portal for XDG.
      xdg-utils                 # XDG desktop utilities.
      wev                       # Inspect keys.
      wtype                     # Used to enable NumLock on boot.


      # ------------- Wayland Components --------------

      polkit_gnome              # Floating password prompt.
      libnotify                 # Notifications graphic engine.
    ];

    # Make sure this version is the same as the one in the main configuration.nix
    stateVersion = "26.05";
  };

  # Program enabling
  programs.swaylock.enable = true;
  programs.home-manager.enable = true;
}
