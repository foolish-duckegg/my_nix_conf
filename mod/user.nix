{ config, lib, pkgs, inputs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.duckegg = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "123456";
    packages = with pkgs; [
      tree
    ];
  };

  #home-manager
  home-manager.users.duckegg = {pkgs, ... }: {
    home.packages = with pkgs; [
      chromium
    ];
    
    # niri config
    xdg.configFile."niri/config.kdl".text = ''
      include "/etc/nixos/niri-config.kdl"

      // spawn-at-startup "waybar"

      prefer-no-csd

      binds {
      	Mod+T hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
      }
    '';
    
    home.stateVersion = "25.11";
  };
}
