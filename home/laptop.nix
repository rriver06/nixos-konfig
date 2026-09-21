{ config, pkgs, ... }:

{
  imports = [
    # System utils configurations.
    ./apps/git.nix
    ./apps/bash.nix
    ./apps/fzf.nix
    ./apps/zoxide.nix
    ./apps/bat.nix
    ./apps/delta.nix
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
