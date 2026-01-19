{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod4"; # Super / Windows key

      terminal = "alacritty";

      keybindings = {
        "Mod4+Return" = "exec alacritty";
        "Mod4+d" = "exec fuzzel";
        "Mod4+Shift+e" = "exit";
      };

      bars = [ ]; # IMPORTANT: disable swaybar (we use waybar)
    };

    extraConfig = ''
      exec waybar
    '';
  };
}
