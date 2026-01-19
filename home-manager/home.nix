{ inputs, outputs, lib, config, pkgs, ... }:
{
  # Import all home-manager modules
  imports = [
    ../modules/home-manager
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "askeladd";
    homeDirectory = "/home/askeladd";
    stateVersion = "25.11";

    # Session variables for Wayland
    sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
  };

  # Enable home-manager
  programs.home-manager.enable = true;
}