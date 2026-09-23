{ ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    # Make fzf use fd.
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    fileWidget.command = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    changeDirWidget.command = "fd --type d --strip-cwd-prefix --hidden --exclude .git";
  };
}
