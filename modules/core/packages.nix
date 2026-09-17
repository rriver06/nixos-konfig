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
    # System management
    btop                # TUI Resource monitor.
    fastfetch            # Review your system specs.
    gdu                 # TUI Disk space analizer.
    procs               # Modern replace for ps, inspects processes.

    # File & searching utilities
    udiskie             # Automount USB devices.
    yazi                # TUI File manager.
    eza                 # Modern replace for ls.
    bat                 # Modern replace for cat.
    zoxide              # Modern replace for cd.
    ripgrep             # Search text inside files, use with (rg).
    fd                  # Simple replace for find.
    fzf                 # Fuzzy finder for files, history or lists.

    # Terminal & Sync
    vim                 # VIM, no more description needed.
    zellij              # Terminal multiplexor (open various terminals on just one window, or tty).
    git                 # Version control and repo file sync.
    gh                  # Official GitHib CLI.

    # Network & Downloads
    aria2               # Threaded download manager.
    curl                # Direct downloads from terminal.
    wget                # Direct downloads from terminal.

    # Other system utilities
    btrfs-progs         # Needed for operation with btrfs partitions and subvolumes.
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
