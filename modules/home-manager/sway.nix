{ config, pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;

    config = {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "fuzzel";

      fonts = {
        names = [ "JetBrains Mono" ];
        size = 10.0;
      };

      gaps = {
        inner = 8;
        outer = 4;
      };

      input = {
        "*" = {
          xkb_layout = "us";
          natural_scroll = "enabled";
        };
      };

      keybindings = {
        "Mod4+Return" = "exec alacritty";
        "Mod4+d" = "exec fuzzel";
        "Mod4+Shift+e" = "exit";
        "Mod4+Shift+q" = "kill";
        "Mod4+h" = "focus left";
        "Mod4+j" = "focus down";
        "Mod4+k" = "focus up";
        "Mod4+l" = "focus right";
        "Mod4+Shift+h" = "move left";
        "Mod4+Shift+j" = "move down";
        "Mod4+Shift+k" = "move up";
        "Mod4+Shift+l" = "move right";
        "Mod4+f" = "fullscreen toggle";
      };

      bars = [ ]; # disable swaybar (we use waybar)
    };

    extraConfig = ''
      exec waybar
      exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
    '';
  };
}
