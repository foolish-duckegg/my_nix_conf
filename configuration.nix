{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./mod/desktop.nix
      ./mod/systemconfig.nix
      ./mod/user.nix
      ./mod/packages.nix
      ./mod/language.nix
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

  system.stateVersion = "25.11"; # Did you read the comment?

}

