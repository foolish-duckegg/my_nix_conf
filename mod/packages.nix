{ config, lib, pkgs, inputs, ... }:

{
  # List packages installed in system profile.
  environment = {
    systemPackages = with pkgs; [
      # init
      vim wget curl git zip unzip

      # icons
      hicolor-icon-theme adwaita-icon-theme librsvg

      # niri configuation
      kitty fuzzel wayland-utils 

      # daily
      firefox
    ];

    pathsToLink = [ "/share/icons" ];

    sessionVariables = {
      XDG_DATA_DIRS = [ "${pkgs.hicolor-icon-theme}/share" ];
    };
  };
}
