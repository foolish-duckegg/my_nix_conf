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
      include "/etc/nixos/resources/niri-config.kdl"

      // spawn-at-startup "waybar"

      prefer-no-csd

      binds {
      	Mod+T hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
      }
    '';
    
    home.stateVersion = "25.11";

    home.file = {
      ".local/share/fcitx5/rime/default.custom.yaml".text = ''
        patch:
          __include: rime_ice_suggestion:/

          schema_list:
            - schema: double_pinyin
            - schema: rime_ice
      '';
      ".local/share/fcitx5/rime/double_pinyin.schema.yaml".source = ../resources/double_pinyin.schema.yaml;
    };
  };
}
