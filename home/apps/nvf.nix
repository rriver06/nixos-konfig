{ ... }:

{
  programs.nvf = {
    enable = true;
    enableManpages = true;

    settings.vim = {
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
      };
      statusline.lualine.enable = true;
      telescope.enable = true;
      filetree.neo-tree.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      # Add languages support
      languages = {
        enableTreesitter = true;
        enableFormat = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = [ "nixfmt" ];
          };
        };
      };

      # Enable EXRC
      options = {
        exrc = true;
      };

      # Add external modules (example)
      # extraPlugins = with pkgs.vimPlugins; {
      #   exrc-nvim = {
      #     package = exrc-nvim;
      #     setup = "require('exrc').setup()";
      #   };
      # };

      # Show floating menu with suggestions
      binds.whichKey.enable = true;

      # Closes keys, parenthesis and comments by default
      autopairs.nvim-autopairs.enable = true;

      # Visual integration with git
      git.gitsigns.enable = true;

      # Highlights and searches comments like TODO:, FIXME:, etc.
      notes.todo-comments.enable = true;

      # Nice start screen when starting without any file
      dashboard.dashboard-nvim.enable = true;

      # Intelligent autofill
      autocomplete.nvim-cmp.enable = true;

    };
  };
}
