{ config, lib, pkgs, ... }:

{
  # ---------------------------------------------------------------------
  #                              PACKAGES
  # ---------------------------------------------------------------------

  # Set system architecture.
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Enable support for Flakes & new Nix CLI.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow some unfree packages
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkg.pname or (builtins.parseDrvName pkg.name).name) [
    "vscode"
  ];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    btrfs-progs
    curl
    git
    udiskie
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  ];

  # Program enabling/disabling.
  # programs.firefox.enable = true;

  # Nix-collect-garbage (auto clean /nix/store)
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };


  # ---------------------------------------------------------------------
  #                           PROGRAM SETTINGS
  # ---------------------------------------------------------------------

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

}
