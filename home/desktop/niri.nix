{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.config
  ];

  programs.niri = {
    settings = {

      # Prevents client side decorations.
      prefer-no-csd = true;

      # Don't show keybinds on startup.
      hotkey-overlay.skip-at-startup = true;

      # Screenshot save path
      screenshot-path = "~/Pictures/Screenshots/Screenshot From %Y-%m-%d %H-%M-%S.png";

      # Disable default clipboard management.
      clipboard.disable-primary = true;


      # Autostart programs and shells.
      spawn-at-startup = [
        # Noctalia shell.
        { command = [ "noctalia" ]; }

        # Enable NumLock by default.
        { command = [ "${pkgs.wtype}/bin/wtype" "-k" "Num_Lock" ]; }

        # Xwayland server.
        { command = [ "xwayland-satellite" ]; }

        # Autostart for future (when I leave noctalia)
        # Polkit service.
        { command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }

        # Taskbar.
        # Already started by systemd.

        # Wallpaper service.
        # { command = [ "swaybg" "-m" "fill" "-i" "${config.home.homeDirectory}/Pictures/Wallpapers/PC/Windows Vista.jpg" ]; }

        # Autolock screen service.
        # That's what swayidle is used for, I might set it up later.

        # WiFi applet on the taskbar.
        # { command = [ "nm-applet" "--indicator" ]; }

        # Notification daemon.
        # { command = [ "mako" ]; }

        # Clipboard history.
        { command = [ "wl-paste" "--watch" "cliphist" "store" ]; }
      ];


      # Niri environment settings.
      environment = {
        DISPLAY = ":0";
        WAYLAND_DISPLAY = "wayland-1";
        GDK_BACKEND = "wayland,x11";
        QT_QPA_PLATFORM = "wayland;xcb";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
      };


      # Set cursor theme.
      cursor = {
        theme = "Adwaita";
        size = 24;
        hide-when-typing = true;
        hide-after-inactive-ms = 1000;
      };


      # Layout config.
      layout = {
        gaps = 14;                            # Space around and between windows.
        center-focused-column = "on-overflow";

        # Column widths presets.
        preset-column-widths = [
          { proportion = 0.25; }
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 0.75; }
          { proportion = 1.0; }
        ];

        # Window height presets.
        preset-window-heights = [
          { proportion = 0.25; }
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
          { proportion = 0.75; }
          { proportion = 1.0; }
        ];

        # Column width value.
        default-column-width = { proportion = 0.5; };

        # Window borders (disabled in favor or focus-ring)
        border = { enable = false; };

        # Color border around active windows.
        focus-ring = {
          enable = true;
          width = 3;
          # Color for active/inactive border.
          active.color = "#7aa2f7";
          inactive.color = "#24283b";
        };

      };


      # Animations settings.
      animations = {
        workspace-switch = {
          kind.spring = { damping-ratio = 1.0; stiffness = 1000; epsilon = 0.0001; };
        };
        window-open = {
          kind.easing = {
            duration-ms = 150;
            curve = "ease-out-expo";
          };
        };
        window-close = {
          kind.easing = {
            duration-ms = 150;
            curve = "ease-out-quad";
          };
        };
        window-movement = {
          kind.easing = {
            duration-ms = 150;
            curve = "ease-out-expo";
          };
        };
        window-resize = {
          kind.easing = {
            duration-ms = 150;
            curve = "ease-out-expo";
          };
        };
      };


      # Layer rules.
      layer-rules = [

        # Wallpaper goes at the bottom layer
        {
          matches = [ { namespace = "^wallpaper$"; } ];
          place-within-backdrop = true;
        }

      ];


      # Window rules.
      window-rules = [

        # Disable borders for inactive windows.
        {
          matches = [ { is-active = false; } ];
          draw-border-with-background = false;
        }

        # Rounded windows radius.
        {
          geometry-corner-radius = {
            top-left = 16.0;
            top-right = 16.0;
            bottom-left = 16.0;
            bottom-right = 16.0;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }

        # Force dialogs to be floating windows.
        {
          matches = [
            { app-id = "^blueman-manager$"; }
            { app-id = "^nm-connection-editor$"; }
            { app-id = "^polkit-gnome-authentication-agent-1$"; }
            { app-id = "^org.gnome.Calculator$"; }
            { app-id = "^swappy$"; }
            { app-id = "^wlogout$"; }
            { app-id = "FileRoller"; }
            { title = "^(Open File|Save File|Save As|Choose File|Select a File|Authentication Required)$"; }
            { title = "^(Preferences|Settings|About|Properties)$"; }
            { app-id = "^steam$"; title = "^Steam Dialog$"; }
          ];
          open-floating = true;
          open-focused = true;
        }

        # Settings for pavucontrol.
        {
          matches = [
            { app-id = "pavucontrol"; }
          ];
          open-floating = true;
          default-column-width = { fixed = 650; };
          default-window-height = { fixed = 450; };
        }

        # Mantains PIP video on lower corner.
        {
          matches = [
            { title = "^Picture-in-Picture$"; }
          ];
          open-floating = true;
          open-focused = true;
          default-column-width = { fixed = 480; };
        }

        # Telegram Media Viewer
        {
          matches = [
            { app-id = "^org.telegram.desktop$"; title = "^Media viewer$"; }
          ];
          open-fullscreen = true;
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
            { app-id = "(?i).*(jsb).*"; }
            { app-id = "(?i).*(delivery-beyond).*"; }
            { app-id = "(?i).*(dragnwash).*"; }
            { app-id = "(?i).*(quaver).*"; }
            { app-id = "(?i).*(snapgame).*"; }
            { app-id = "(?i).*(beat banger).*"; }
            # { app-id = "^game-id$"; }
          ];
          open-maximized = true;
          open-floating = false;
          default-column-width = { proportion = 1.0; };
        }

        # Make steam friends tab behave normally.
        {
          matches = [
            { app-id = "^steam$"; title = "(?i).*(amigos|friends|chat).*"; }
          ];
          open-maximized = false;
          open-floating = true;
          default-column-width = { fixed = 380; };
          default-window-height = { fixed = 750; };
        }

        # Make steam notifications act normal.
        {
          matches = [
            { app-id = "^steam$"; title = "^notificationtoasts_\\d+_desktop$"; }
          ];
          open-floating = true;
          open-focused = false;
          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
        }

        # Open wl-mirror automatically on external display.
        {
          matches = [
            { app-id = "^at\\.yrlf\\.wl_mirror$"; }
          ];
          open-on-output = "HDMI-A-1";
          open-fullscreen = true;
        }

        # Exclude apps from screen recordings.
        {
          matches = [
            { app-id = "^KeePassXC$"; }
          ];
          block-out-from = "screen-capture";
        }

        # Exclude Noctalia or its borders from shadows/borders.
        {
          matches = [
            { app-id = "^noctalia"; }
          ];
          draw-border-with-background = false;
        }

      ];


      # Display configuration
      outputs = {

        # Laptop screen.
        "eDP-1" = {
          scale = 1.0;
        };

        # HDMI output.
        "HDMI-A-1" = {
          scale = 1.0;
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.000;
          };
        };

      };


      # Gestures settings.
      gestures = {

        # top-left attribute doesn't exists.
        # hot-corners = {
        #   top-left = "toggle-overview";
        # };

        dnd-edge-view-scroll = {
          trigger-width = 30;
          delay-ms = 100;
          max-speed = 2000;
        };

        dnd-edge-workspace-switch = {
          trigger-height = 50;
          delay-ms = 100;
          max-speed = 2000;
        };

      };


      # Keyboard binds.
      binds = {
        # Multimedia keys.
        "XF86AudioRaiseVolume".action.spawn  = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" ];
        "XF86AudioLowerVolume".action.spawn  = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
        "XF86AudioMute".action.spawn         = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
        "XF86AudioMicMute".action.spawn      = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
        "XF86MonBrightnessUp".action.spawn   = [ "brightnessctl" "set" "5%+" ];
        "XF86MonBrightnessDown".action.spawn = [ "brightnessctl" "set" "5%-" ];
        "XF86AudioPlay".action.spawn         = [ "playerctl" "play-pause" ];
        "XF86AudioNext".action.spawn         = [ "playerctl" "next" ];
        "XF86AudioPrev".action.spawn         = [ "playerctl" "previous" ];

        # App Execution.
        "Mod+Return".action.spawn = [ "kitty" ];
        "Mod+S".action.spawn      = [ "fuzzel" ];
        "Mod+E".action.spawn      = [ "nautilus" ];
        "Mod+B".action.spawn      = [ "zen" ];

        # Sound manager
        "Mod+Alt+S".action.spawn = [ "pavucontrol" ];

        # Notification Shortcuts
        # "Mod+Shift+N".action.spawn       = [ "makoctl" "dismiss" ];
        # "Mod+Ctrl+Shift+N".action.spawn  = [ "makoctl" "restore" ];

        # Interactive clipboard manager.
        "Mod+V".action.spawn = [ "sh" "-c" "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy" ];

        # Change keyboard language.
        "Mod+Space".action.switch-layout = "next";

        # Power menu and screen lock.
        "Mod+Alt+P".action.spawn  = [ "wlogout" ];
        "Mod+Alt+L".action.spawn  = [ "swaylock" "-f" ];

        # Screenshots.
        # Full screen.
        "Print".action.screenshot = [];
        "Alt+Print".action.screenshot-screen = [];
        "Mod+Print".action.screenshot-window = [];
        # Select region.
        "Mod+Shift+Print".action.spawn = [ "sh" "-c" "grim -g \"$(slurp)\" - | swappy -f -" ];

        # Screen Recording
        # Record a selected area (repeat shortcut to stop
        "Mod+Ctrl+Alt+Print".action.spawn-sh = ''
          pgrep -x wf-recorder >/dev/null && pkill -x wf-recorder || wf-recorder -g \"$(slurp)\" -f \"$HOME/Videos/Recordings/recording-$(date +%F-%H%M%S).mp4\"
        '';


        # Window shortcuts.
        # Close windows.
        "Mod+Shift+Q".action.close-window = [];

        # Navigation.
        "Mod+Left".action.focus-column-left = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+Up".action.focus-window-up = [];
        "Mod+Down".action.focus-window-down = [];
        "Mod+Home".action.focus-column-first = [];
        "Mod+End".action.focus-column-last = [];
        # Alt Navigation (DFJK).
        "Mod+D".action.focus-column-left = [];
        "Mod+K".action.focus-column-right = [];
        "Mod+J".action.focus-window-up = [];
        "Mod+F".action.focus-window-down = [];

        # Change window position.
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Right".action.move-column-right = [];
        "Mod+Shift+Up".action.move-window-up = [];
        "Mod+Shift+Down".action.move-window-down = [];
        "Mod+Shift+Home".action.move-column-to-first = [];
        "Mod+Shift+End".action.move-column-to-last = [];
        # Alt keys (DFJK).
        "Mod+Shift+D".action.move-column-left = [];
        "Mod+Shift+K".action.move-column-right = [];
        "Mod+Shift+J".action.move-window-up = [];
        "Mod+Shift+F".action.move-window-down = [];

        # Change window dimensions.
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";

        # Window view.
        "Mod+R".action.switch-preset-column-width = [];
        "Mod+Shift+R".action.switch-preset-column-width-back = [];
        "Mod+Ctrl+R".action.switch-preset-window-height = [];
        "Mod+Ctrl+Shift+R".action.reset-window-height = [];
        "Mod+Ctrl+F".action.maximize-column = [];
        "Mod+Ctrl+Shift+F".action.fullscreen-window = [];
        "Mod+Shift+C".action.center-column = [];
        # "Mod+Tab".action.toggle-overview = [];
        "Mod+Shift+Slash".action.show-hotkey-overlay = [];

        # Column organization.
        "Mod+BracketLeft".action.consume-or-expel-window-left = [];
        "Mod+BracketRight".action.consume-or-expel-window-right = [];
        "Mod+Comma".action.consume-window-into-column = [];
        "Mod+Period".action.expel-window-from-column = [];

        # Floating and tiling toggle.
        "Mod+Ctrl+Space".action.toggle-window-floating = [];
        "Mod+Alt+Space".action.switch-focus-between-floating-and-tiling = [];


        # Workspace navigation.
        "Mod+Page_Down".action.focus-workspace-down = [];
        "Mod+Page_Up".action.focus-workspace-up = [];
        "Mod+Shift+Page_Down".action.move-column-to-workspace-down = [];
        "Mod+Shift+Page_Up".action.move-column-to-workspace-up = [];

        # Navigation using the mouse wheel.
        "Mod+WheelScrollDown".action.focus-workspace-down = [];
        "Mod+WheelScrollUp".action.focus-workspace-up = [];
        "Mod+Shift+WheelScrollDown".action.focus-column-left = [];
        "Mod+Shift+WheelScrollUp".action.focus-column-right = [];
        
        # Quick shortcuts for desktops from 1 to 9.
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        # Move active window to specific desktop (from 1 to 9)
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;


        # Monitor Navigation.
        "Mod+Ctrl+Left".action.focus-monitor-left = [];
        "Mod+Ctrl+Right".action.focus-monitor-right = [];
        "Mod+Ctrl+Up".action.focus-monitor-up = [];
        "Mod+Ctrl+Down".action.focus-monitor-down = [];

        # Change window monitor.
        "Mod+Ctrl+Shift+Left".action.move-column-to-monitor-left = [];
        "Mod+Ctrl+Shift+Right".action.move-column-to-monitor-right = [];
        "Mod+Ctrl+Shift+Up".action.move-window-to-monitor-up = [];
        "Mod+Ctrl+Shift+Down".action.move-window-to-monitor-down = [];


        # Monitor related shortcuts
        # Power off active screen.
        "Mod+Shift+P".action.power-off-monitors = [];

        # Power off laptop screen when connected to external source (desktop is moved).
        "Mod+F8".action.spawn                   = [ "wlr-randr" "--output" "eDP-1" "--off" ];
        "Mod+Shift+F8".action.spawn             = [ "wlr-randr" "--output" "eDP-1" "--on" ];

        # Screen mirroring to external HDMI source.
        "Mod+Ctrl+M".action.spawn-sh = ''
          wl-mirror $(niri msg -j focused-output | jq -r .name) &
          sleep 0.3 && niri msg action focus-monitor "HDMI-A-1" && sleep 0.1 && niri msg action focus-monitor "eDP-1"
        '';


        # End Niri session
        "Mod+Ctrl+Alt+C".action.quit = [];

      };


      # Keyboard/Mouse settings.
      input = {

        keyboard = {
          xkb = {
            # Keyboard distribution, alternatively use "latam".
            layout = "us,latam";
            # Change layout using Win+Space.
            # Causes problems with other keybinds, replaced by switch-layout method.
            # options = "grp:win_space_toggle";
          };
          # Keyboard repeat options.
          repeat-delay = 300;
          repeat-rate = 50;
        };

        touchpad = {
          tap = true;
          dwt = true;                      # Disable touchpad while text input is active.
          natural-scroll = true;
          accel-profile = "adaptive";
          click-method = "clickfinger";    # Two fingers tap for right click.
        };

        mouse = {
          accel-profile = "flat";          # 1:1 movement, gives better precision on mouse.
        };

        # Moves mouse to focused window.
        warp-mouse-to-focus.enable = true;

      };


    };
  };

}
