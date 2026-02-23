{ config, lib, pkgs, inputs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # init
    vim wget curl git neovim

    # niri configuation
    kitty fuzzel wayland-utils 

    # daily
    firefox
  ];
}
