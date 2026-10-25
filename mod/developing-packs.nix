{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.developing_packages {
  networking.hosts = {
    "127.0.0.1" = [
      "my-agent.local"
      "penetration.test"
      "mylocal.my"
      "10.mylocal.my"
      "9.mylocal.my"
      "11.mylocal.my"
    ];
  };
  environment.systemPackages = with pkgs; [
    obsidian
    javaPackages.compiler.openjdk21
  ];
}
