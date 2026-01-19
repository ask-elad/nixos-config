{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";
      height = 28;

      modules-left = [ "sway/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "network" "battery" ];

      clock = {
        format = "{:%a %d %b  %H:%M}";
      };
    }];

    style = ''
      * {
        font-family: JetBrains Mono;
        font-size: 11px;
      }

      window#waybar {
        background: #1e1e2e;
        color: #cdd6f4;
      }

      #workspaces button {
        padding: 0 8px;
        color: #cdd6f4;
      }

      #workspaces button.focused {
        background: #89b4fa;
        color: #1e1e2e;
      }
    '';
  };
}
