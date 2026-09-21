{ pkgs, ... }:

{
  programs.bash = {
    # Make fzf use fd.
    extraInit = ''
      export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --exclude .git'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --exclude .git'
      export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    '';

    # Replace cd command with z (zoxide).
    interactiveShellInit = ''
      eval "$(zoxide init bash --cmd cd)"
    '';

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
