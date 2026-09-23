{ ... }:

{
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [
      "--cmd cd"    # Replaces the cd command with zoxide.
    ];
  };
}
