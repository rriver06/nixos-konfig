{ pkgs, ... }:

{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      navigate = true;        # Use 'n' and 'N' to jump between diff hunks.
      line-numbers = true;
      side-by-side = true;    # Render diffs side-by-side instead of inline.
      # syntax-theme = "Catppuccin-mocha";    I'll search for a theme later.
    };

  };
}
