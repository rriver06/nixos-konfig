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
    # ------------------------ TUI Programs -----------------------------

    # System management
    btop                # TUI Resource monitor.
    gdu                 # TUI Disk space analizer.

    # Project management
    lazygit             # Interactive Git interface.

    # Various utilities
    nnn                 # TUI File manager.


    # ---------------------- System utilities ---------------------------

    # System management
    fastfetch           # Review your system specs.
    nh                  # Nix CLI Helper.
    nix-index           # Allows package indexing.
    comma               # Instantly execute programs without rebuilding.
    direnv              # Loads dependencies when entering a project directory.
    nix-direnv          # Adds persistent caching for direnv.
    procs               # Modern replace for ps, inspects processes.

    # File & searching utilities
    udiskie             # Automount USB devices.
    eza                 # Modern replace for ls.
    bat                 # Modern replace for cat.
    zoxide              # Modern replace for cd.
    ripgrep             # Search text inside files, use with (rg).
    fd                  # Simple replace for find.
    fzf                 # Fuzzy finder for files, history or lists.
    sd                  # Intuitive replacement for sed.
    delta               # Syntax-highlightning pager for git diff and file comparisons.
    dust                # Modern du replacement.
    duf                 # Colorized table-based df alternative.
    atuin               # Replaces shell history with an SQLite-backed database.
    tealdeer            # High-speed rust client for tldr, provides cheat-sheets with man info.

    # Terminal & sync
    vim                 # VIM, no more description needed.
    tmux                # Terminal multiplexor (open various terminals on just one window, or tty).
    git                 # Version control and repo file sync.
    gh                  # Official GitHib CLI.

    # Network & downloads
    aria2               # Threaded download manager.
    curl                # Direct downloads from terminal.
    wget                # Direct downloads from terminal.
    speedtest-cli       # Make internet speed tests directly from terminal.

    # Others
    btrfs-progs         # Needed for operation with btrfs partitions and subvolumes.
  ];

  # Program enabling/disabling.
  # programs.firefox.enable = true;


  # ---------------------------------------------------------------------
  #                                CLEANUP
  # ---------------------------------------------------------------------

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
