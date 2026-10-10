{ pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;

    settings = builtins.fromTOML (builtins.readFile ../../themes/starship-gruvbox.toml);
  };
}
