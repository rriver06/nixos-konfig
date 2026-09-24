{ config, pkgs, ... }:

{
  imports = [
    # System utils configurations.
    ./utils/git.nix
    ./utils/bash.nix
    ./utils/fzf.nix
    ./utils/zoxide.nix
    ./utils/bat.nix
    ./utils/delta.nix
    ./utils/ssh.nix
    ./utils/terminal.nix

    # App settings.
    # ./apps/app.nix

    # AppImage settings.
    # ./apps/appimages/appimage-template.nix
  ];

  home = {
    # Make sure to check the username
    username = "rriver06";
    homeDirectory = "/home/rriver06";

    # Make sure this version is the same as the one in the main configuration.nix
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
