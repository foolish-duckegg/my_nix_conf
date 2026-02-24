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

    # use zsh
    shell = pkgs.zsh;
  };

  # zsh
  # 启用 Zsh 模块
  programs.zsh = {
    enable = true;
   
    # 自动补全和语法高亮（非常推荐）
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # 如果你想用 Oh My Zsh
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "jonathan";
    };
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
      # fcitx
      ".local/share/fcitx5/rime/default.custom.yaml".source = ../resources/fcitx/default.custom.yaml;
      ".local/share/fcitx5/rime/double_pinyin.schema.yaml".source = ../resources/fcitx/double_pinyin.schema.yaml;
      ".local/share/fcitx5/themes" = {
        source = ../resources/fcitx/themes;
	recursive = true;
      };

      # kitty
      ".config/kitty/kitty.conf".source = ../resources/kitty.conf;

      # font
      ".local/share/fonts".source = ../resources/font;

      # fuzzel theme
      ".config/fuzzel".source = ../resources/fuzzel;

      #cursor
      ".local/share/icons".source = ../resources/cursors;
    };
  };
}
