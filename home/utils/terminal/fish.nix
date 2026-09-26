{ pkgs, config, ... }:

{
  # Fish configuration.
  programs.fish = {
    enable = true;

    shellInit = "fastfetch";
    functions = {
      fish_greeting = "echo 'Welcome back!'";
    };
  };

}
