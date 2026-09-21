{ ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    # Make fzf use fd.
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    fileWidgetCommand = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    changeDirWidgetCommand = "fd --type d --strip-cwd-prefix --hidden --exclude .git";
  };
}
