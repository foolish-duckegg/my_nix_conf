{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.living_packages {
  environment.systemPackages = with pkgs; [
    # 推荐使用 uos 版本，对 Linux 支持较好
    # wechat-uos
    # 或者尝试较新的 wechat-2.0
    # "wechat-2.0"
    wechat

    qq

    # 音乐
    go-swagger
  ];
}
