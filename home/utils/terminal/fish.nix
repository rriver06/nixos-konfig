{ pkgs, config, ... }:

{
  # Fish configuration.
  programs.fish = {
    enable = true;

    shellInit = "pokefetch";
    functions = {
      fish_greeting = "echo 'Welcome back!'";
    };
  };

}
