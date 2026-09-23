{ pkgs, config, ... }:

{
  # Sets bash as the default terminal (delete after installing fish).
  programs.bash = {
    enable = true;
  };
}
