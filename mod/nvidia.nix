{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:
lib.mkIf env_settings.is_including_nvidia {

  # Nvidia 驱动
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = env_settings.is_including_nvidia;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    egl-wayland
    lshw
  ];
}
