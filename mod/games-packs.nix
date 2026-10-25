{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.games_packages {

  services.flatpak.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # 开启远程同乐防火墙
    dedicatedServer.openFirewall = true; # 开启专用服务器防火墙
  };

  environment.systemPackages = with pkgs; [
    flatpak
  ];
  environment.sessionVariables = {
    XDG_DATA_DIRS = [
      "/var/lib/flatpak/exports/share"
      "\${HOME}/.local/share/flatpak/exports/share"
    ];
  };

}
