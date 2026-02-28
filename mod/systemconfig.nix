{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:

{

  # Set your time zone.
  time.timeZone = env_settings.timeZone;

  # Configure network proxy if necessary
  networking.proxy.default = env_settings.proxy_url;
  networking.proxy.noProxy = env_settings.no_proxy_url;

  # vm copied-board sync
  services.spice-vdagentd.enable = true;

  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = env_settings.boot_device; # or "nodev" for efi only
  boot.loader.systemd-boot.enable = false;

  networking.hostName = env_settings.host_name; # Define your hostname.

  # enable unfree solf ware
  nixpkgs.config.allowUnfree = true;

}
