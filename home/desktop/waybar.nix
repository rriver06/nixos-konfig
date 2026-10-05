{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {

      mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 6;

        modules-left = [
          "custom/launcher"
          "niri/workspaces"
          "niri/window"
        ];

        modules-center = [
          "clock"
        ];

        modules-right = [
          "idle_inhibitor"
          "pulseaudio"
          "backlight"
          "network"
          "bluetooth"
          "battery"
          "tray"
          "custom/power"
        ];

        "custom/launcher" = {
          format = "";
          tooltip = false;
          on-click = "fuzzel";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = "";
            active = "";
          };
        };

        "niri/window" = {
          format = "{}";
          rewrite = {
            "(.*) — Mozilla Firefox" = "󰈹 $1";
            "(.*) - Visual Studio Code" = "󰨞 $1";
            "(.*) - kitty" = "󰄛 $1";
          };
          max-length = 70;
        };

        clock = {
          format = "󰥔  {:%a %d %b  %H:%M}";
          tooltip-format = "<big>{:%A, %d de %B de %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };

        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
          tooltip = true;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁 mute";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };

        backlight = {
          format = "󰃠 {percent}%";
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        network = {
          format-wifi = "󰖩 {signalStrength}%";
          format-ethernet = "󰈀 conectado";
          format-disconnected = "󰖪 sin red";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        bluetooth = {
          format = "󰂯";
          format-disabled = "󰂲";
          format-connected = "󰂱 {device_alias}";
          tooltip-format = "{controller_alias}\t{controller_address}";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
          on-click = "blueman-manager";
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-alt = "{timeTo}";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        tray = {
          spacing = 10;
        };

        "custom/power" = {
          format = "";
          tooltip = false;
          on-click = "wlogout";
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Noto Sans";
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.92);
        color: #cdd6f4;
        border-bottom: 1px solid rgba(137, 180, 250, 0.35);
      }

      #custom-launcher,
      #workspaces,
      #window,
      #clock,
      #idle_inhibitor,
      #pulseaudio,
      #backlight,
      #network,
      #bluetooth,
      #battery,
      #tray,
      #custom-power {
        padding: 0 10px;
        margin: 5px 2px;
        border-radius: 8px;
      }

      #custom-launcher {
        color: #89b4fa;
        font-size: 18px;
        padding-left: 12px;
        padding-right: 12px;
      }

      #workspaces button {
        color: #6c7086;
        padding: 0 5px;
        border-radius: 7px;
      }

      #workspaces button.active {
        color: #89b4fa;
        background: #313244;
      }

      #workspaces button.focused {
        color: #cba6f7;
      }

      #workspaces button.urgent {
        color: #f38ba8;
      }

      #window {
        color: #bac2de;
      }

      #clock {
        color: #f9e2af;
        background: #313244;
      }

      #pulseaudio {
        color: #a6e3a1;
      }

      #backlight {
        color: #f9e2af;
      }

      #network {
        color: #89dceb;
      }

      #bluetooth {
        color: #89b4fa;
      }

      #battery {
        color: #a6e3a1;
      }

      #battery.warning {
        color: #f9e2af;
      }

      #battery.critical {
        color: #f38ba8;
      }

      #custom-power {
        color: #f38ba8;
        font-size: 16px;
      }
    '';
  };

}
