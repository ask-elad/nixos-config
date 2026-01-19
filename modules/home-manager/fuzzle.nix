{ config, pkgs, ... }:

{
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "JetBrains Mono:size=11";
        lines = 10;
      };
    };
  };
}
