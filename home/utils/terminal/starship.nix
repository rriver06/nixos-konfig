{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    # settings = builtins.fromTOML (builtins.readFile ../../themes/starship-catppuccin.toml);
  };
}
