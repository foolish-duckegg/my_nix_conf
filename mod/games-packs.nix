{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.games_packages {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # 开启远程同乐防火墙
    dedicatedServer.openFirewall = true; # 开启专用服务器防火墙
  };
}
