{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri = {
    settings = {
      # Autostart programs and shells.
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
        { command = [ "xwayland-satellite" ]; }
      ];

      # Window rules.
      window-rules = [

        # Force dialogs to be floating windows.
        {
          matches = [
            { app-id = "^pavucontrol$"; }
            { app-id = "^nm-connection-editor$"; }
            { app-id = "^gnome-calculator$"; }
            { app-id = "file-roller"; }
          ];
          open-floating = true;
        }

        # Mantains PIP video on lower corner.
        {
          matches = [
            { app-id = "firefox$"; title = "^Picture-in-Picture$"; }
            { app-id = "zen"; title = "^Picture-in-Picture$"; }
            { app-id = "brave"; title = "^Picture-in-Picture$"; }
          ];
          open-floating = true;
          default-column-width = { fixed = 480; };
        }

        # Terminal rules.
        {
          matches = [
            { app-id = "^kitty$"; }
          ];
          # Fix rounded edges (if used).
          clip-to-geometry = true;
        }

        # Fullscreen apps rules.
        {
          matches = [
            { app-id = "^steam$"; }
            { app-id = "^heroic$"; }
          ];
          open-maximized = true;
        }

        # Exclude Noctalia or its borders from shadows/borders.
        {
          matches = [
            { app-id = "^noctalia"; }
          ];
          draw-border-with-background = false;
        }

      ];

      # Layout config.
      layout = {
        gaps = 12;    # Space around windows.

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        default-column-width = { proportion = 0.5; };

        # Focus ring that goes with noctalia.
        focus-ring = {
          enable = true;
          width = 2;
          # Colors for active/inactive border.
          active.color = "#7aa2f7";
          inactive.color = "#24283b";
        };

      };

      # Keyboard binds.
      binds = {
        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+Alt+L".action.spawn = "swaylock";
      };

    };
  };

}
