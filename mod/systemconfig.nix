{ config, lib, pkgs, inputs, ... }:

{

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  networking.proxy.default = "socks4://192.168.122.98:10808";
  networking.proxy.noProxy = "126.0.0.1,localhost,internal.domain";

  # vm copied-board sync
  services.spice-vdagentd.enable = true;
}
