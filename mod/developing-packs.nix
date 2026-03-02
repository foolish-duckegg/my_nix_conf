{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.developing_packages {
  environment.systemPackages = with pkgs; [
    obsidian
  ];
}
