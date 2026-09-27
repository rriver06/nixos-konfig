{ pkgs, config, ... }:

{
  # Fish configuration.
  programs.fish = {
    enable = true;

    functions = {
      fish_greeting = "echo 'Welcome back!'";
      pf = "clear && pokeget random --hide-name | fastfetch --file-raw -";
    };

    interactiveShellInit = ''
      pf
    '';

  };
}
