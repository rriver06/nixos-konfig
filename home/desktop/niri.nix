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


      # Layout config.
      layout = {
        gaps = 14;    # Space around windows.

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

        # Maximized apps rules.
        {
          matches = [
            # Game Launchers
            { app-id = "^steam$"; }
            { app-id = "^heroic$"; }
            # Games
            { app-id = "^steam_app_.*"; }
            { app-id = "(?i)^gamescope$"; }
            # { app-id = "^game-id$"; }
          ];
          open-maximized = true;
          default-column-width = { proportion = 1.0; };
        }

        # Make steam friends window open floating.
        {
          matches = [
            { app-id = "^steam$"; title = "(?i).*(amigos|friends|chat).*"; }
          ];
          open-maximized = false;
          open-floating = true;
        }

        # Open wl-mirror automatically on external display.
        {
          matches = [
            { app-id = "^at\\.yrlf\\.wl_mirror$"; }
          ];
          open-on-output = "HDMI-A-1";
          open-fullscreen = true;
        }

        # Exclude Noctalia or its borders from shadows/borders.
        {
          matches = [
            { app-id = "^noctalia"; }
          ];
          draw-border-with-background = false;
        }

      ];


      # Keyboard binds.
      binds = {
        # App Execution
        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "fuzzel";
        "Mod+Alt+L".action.spawn = "swaylock";

        # System shortcuts
        "Mod+Shift+E".action.power-off-monitors = {};
        "Mod+F7".action.spawn = [ "wlr-randr" "--output" "eDP-1" "--off" ];
        "Mod+Shift+F7".action.spawn = [ "wlr-randr" "--output" "eDP-1" "--on" ];
        "Mod+Ctrl+M".action.spawn = [ "sh" "-c" "wl-mirror $(niri msg -j focused-output | jq -r .name)" ];
        "Mod+F".action.set-column-width = "100%";
        "Mod+Shift+F".action.fullscreen-window = [ ];
        "Mod+Shift+Q".action.close-window = [ ];
      };


      # Display configuration
      outputs = {
        "HDMI-A-1" = {
          scale = 1.0;
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.000;
          };
        };
      };

    };
  };

}
