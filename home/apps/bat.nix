{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      # theme = "TwoDark";    I'll change this later
    };
  };

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };
}
