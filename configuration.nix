{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only
  boot.loader.systemd-boot.enable = false;

  networking.hostName = "duckegg-nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  networking.proxy.default = "socks5://192.168.122.98:10808";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

      spawn-at-startup "waybar"

      prefer-no-csd

      binds {
      	Mod+T hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
      }
    '';
    
    home.stateVersion = "25.11";
  };

  # services.desktopManager.dms = {
  #   enable = true;
  #   compositor = "niri";
  # };

  # Niri
  programs.niri.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # vm copied-board sync
  services.spice-vdagentd.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # init
    vim wget curl git neovim

    # niri configuation
    kitty fuzzel wayland-utils
    waybar

    # daily
    firefox
  ];

  system.stateVersion = "25.11"; # Did you read the comment?

}

