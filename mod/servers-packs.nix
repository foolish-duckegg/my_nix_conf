{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.servers_packages {
  # v2raA
  services.v2raya.enable = true;
  # 启用 V2Ray 服务
  services.v2ray = {
    enable = true;
  };

  # 确保系统拥有 v2ray 包
  environment.systemPackages = with pkgs; [
    v2ray
  ];
}
