{ ... }:

{
  programs.fzf = {
    enable = true;
    fuzzyCompletion = true;
    keybindings = true;      # Enables Ctrl+R, Ctrl+T, Alt+C.
    enableBashIntegration = true;
  };
}
