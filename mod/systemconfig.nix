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

  networking.hostName = env_settings.host_name; # Define your hostname.

  # enable unfree solf ware
  nixpkgs.config.allowUnfree = true;

}
