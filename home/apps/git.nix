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

      # Better conflict markers when merge conflicts occur.
      merge.conflictstyle = "zdiff3";
    };

  };
}
