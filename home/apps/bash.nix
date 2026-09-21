{ pkgs, ... }:

{
  programs.bash = {
    # Common shell aliases
    shellAliases = {
      # Directory listing y navigation.
      ls = "eza --icons=auto";
      ll = "eza -l --icons=auto --git";
      la = "eza -la --icons=auto --git";
      lt = "eza --tree --icons=auto --git";
      llt = "eza --tree --level=2 --icons=auto --git";
      lllt = "eza --tree --level=3 --icons=auto -a --git";

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
    };
  };
}
