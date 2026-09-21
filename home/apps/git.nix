{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "rriver06";
      user.email = "mauricioriveroruiz24@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nano";     # Change this if you use another editor.
    };

    delta = {
      enable = true;
      options = {
        navigate = true;        # Use 'n' and 'N' to jump between diff hunks.
        line-numbers = true;
        side-by-side = true;    # Render diffs side-by-side instead of inline.
        # syntax-theme = "Catppuccin-mocha";    I'll search for a theme later.
      };
    };

    extraConfig = {
      # Better conflict markers when merge conflicts occur.
      merge.conflictstyle = "zdiff3";
    };

  };
}
