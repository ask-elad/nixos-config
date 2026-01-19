{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    
    settings = [{
      layer = "top";
      position = "top";
      height = 32;
      
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [ "network" "pulseaudio" "clock" ];
      
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
      };
      
      "sway/mode" = {
        format = "<span style=\"italic\">{}</span>";
      };
      
      "sway/window" = {
        max-length = 50;
      };
      
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
      };
      
      network = {
        format-wifi = " {signalStrength}%";
        format-ethernet = " {ipaddr}";
        format-disconnected = "Disconnected ⚠";
        tooltip-format = "{ifname}: {ipaddr}";
      };
      
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = " muted";
        format-icons = {
          default = ["" "" ""];
        };
        on-click = "pavucontrol";
      };
    }];
    
    style = ''
      * {
        font-family: JetBrains Mono, monospace;
        font-size: 13px;
        font-weight: bold;
      }
      
      window#waybar {
        background-color: rgba(30, 30, 46, 0.95);
        color: #cdd6f4;
        border-bottom: 2px solid rgba(137, 180, 250, 0.8);
      }
      
      #workspaces button {
        padding: 0 10px;
        color: #cdd6f4;
        background-color: transparent;
        border: none;
        border-radius: 0;
      }
      
      #workspaces button.focused {
        background-color: rgba(137, 180, 250, 0.3);
      }
      
      #workspaces button:hover {
        background-color: rgba(137, 180, 250, 0.2);
      }
      
      #mode {
        background-color: #f38ba8;
        color: #1e1e2e;
        padding: 0 10px;
      }
      
      #window {
        color: #a6adc8;
      }
      
      #clock,
      #network,
      #pulseaudio {
        padding: 0 15px;
        color: #cdd6f4;
      }
      
      #clock {
        background-color: rgba(137, 180, 250, 0.2);
      }
      
      #network {
        background-color: rgba(166, 227, 161, 0.2);
      }
      
      #pulseaudio {
        background-color: rgba(245, 194, 231, 0.2);
      }
    '';
  };
}