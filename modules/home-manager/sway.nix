{ pkgs, lib, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      menu = "${pkgs.fuzzel}/bin/fuzzel";

      # Gaps
      gaps = {
        inner = 10;
        outer = 5;
      };

      # Keybindings
      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+d" = "exec ${menu}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'Exit sway?' -b 'Yes' 'swaymsg exit'";
        "${modifier}+f" = "fullscreen toggle";
        
        # Focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        
        # Move
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
      };

      # Startup applications
      startup = [
        { command = "${pkgs.waybar}/bin/waybar"; }
      ];

      # Bar (disable built-in, waybar used instead)
      bars = [];
    };

    # Extra configuration
    extraConfig = ''
      # Default border
      default_border pixel 2
      
      # Colors
      client.focused          #4c7899 #285577 #ffffff #2e9ef4 #285577
      client.focused_inactive #333333 #5f676a #ffffff #484e50 #5f676a
      client.unfocused        #333333 #222222 #888888 #292d2e #222222
    '';
  };
}