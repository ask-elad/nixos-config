{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal.family = "JetBrains Mono";
        size = 11;
      };

      window.opacity = 0.95;
    };
  };
}
