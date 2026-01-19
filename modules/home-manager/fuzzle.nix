{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    
    settings = {
      main = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        font = "JetBrains Mono:size=11";
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 10;
      };
      
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        match = "89b4faff";
        selection = "45475aff";
        selection-text = "cdd6f4ff";
        selection-match = "89b4faff";
        border = "89b4faff";
      };
      
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
