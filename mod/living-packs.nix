{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  config = lib.mkIf env_settings.living_packages {
    environment.systemPackages = with pkgs; [
      # 推荐使用 uos 版本，对 Linux 支持较好
      # wechat-uos
      # 或者尝试较新的 wechat-2.0
      # "wechat-2.0"
      wechat

      # qq

      # 音乐
      spotify

      # office
      libreoffice

    ];

    # services.flatpak = {
    #   enable = true;
    #   # 自动添加 Flathub 仓库
    #   remotes = [
    #     {
    #       name = "flathub";
    #       location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    #     }
    #   ];
    #   # 在这里写入 Cisco Webex 的 ID
    #   packages = [
    #     "com.cisco.Webex"
    #   ];
    #   update.auto.enable = true;
    # };
  };
}
