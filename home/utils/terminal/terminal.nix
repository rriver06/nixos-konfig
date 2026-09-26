{ pkgs, config, ... }:

{
  # Define global variables here.
  home = {
    sessionVariables = {
      # Add flake path to NH (rebuild from anywhere).
      NH_FLAKE = "${config.home.homeDirectory}/.config/nixos";
    };

    # Common shell aliases
    shellAliases = {
      # Directory listing y navigation.
      ls = "eza --group-directories-first  --icons=auto";
      ll = "eza -l --group-directories-first --icons=auto --git";
      la = "eza -la --group-directories-first --icons=auto --git";
      lt = "eza --tree --group-directories-first --icons=auto --git";
      llt = "eza --tree --level=2 --group-directories-first --icons=auto --git";
      lllt = "eza --tree --level=3 --group-directories-first --icons=auto -a --git";

      # File & text viewing.
      cat = "bat --paging=never";
      catp = "bat --paging=always";
      preview = "bat --style=full --line-numbers";
      diff = "delta";
      diffs = "delta --side-by-side";
      replace = "sd";

      # Search utilities.
      grep = "rg";
      find = "fd";
      h = "atuin search -i";
      hc = "atuin search --cwd . -i";
      hf = "atuin search --exit 0 -i";

      # System & disk utilities
      df = "duf";
      du = "dust";
      dustd = "dust -d 2";
      ps = "procs";
      cheat = "tldr";
      tldru = "tldr --update";
      nhs = "nh os switch --no-nom";
      nht = "nh os test --no-nom";
      nhb = "nh os boot --no-nom";
    };
  };

}
