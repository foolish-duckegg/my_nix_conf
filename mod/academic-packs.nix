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
  config = lib.mkIf env_settings.academic_packages {
    environment.systemPackages = with pkgs; [
      zotero

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
