{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:

{
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dank-material-shell changes
    };

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = true; # Wallpaper-based theming (matugen)
    enableAudioWavelength = true; # Audio visualizer (cava)
    enableCalendarEvents = true; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
  };

  # Niri
  programs.niri.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # 全局兼容wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    # 对于 Niri，gtk 是必须的（处理图标、文件选择和通知）
    # gnome 换成 gtk 可以保持系统纯净
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome # Niri 抓屏推荐使用的 Portal 后端
    ];

    # 配置 Portal 的策略（告诉系统谁来处理特定的请求）
    config = {
      common = {
        default = [ "gtk" ];
      };
      niri = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "gnome" ];
      };
    };
  };

  # thunar
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin # 右键解压缩
      thunar-volman # 移动设备管理
    ];
  };
  services.gvfs.enable = true; # 开启垃圾桶、网络挂载 (SMB/FTP)、移动设备显示
  services.tumbler.enable = true; # 开启图片/视频缩略图预览
  # 3. 如果在 Niri 下 Thunar 无法保存设置（如侧边栏宽度），需开启：
  programs.xfconf.enable = true; # Xfce 配置存储服务
  environment.systemPackages = with pkgs; [
    file-roller # 配合 thunar-archive-plugin 使用的解压后端
    kdePackages.qtimageformats
    kdePackages.kimageformats
  ];

  # Sunshine
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true; # 赋予 CAP_SYS_ADMIN，允许抓取 KMS/DRM 平面
    openFirewall = true; # 自动放行 47984-48010 系列 TCP/UDP 端口
    package = pkgs.sunshine.override {
      cudaSupport = true;
      cudaPackages = pkgs.cudaPackages;
    };
  };

  hardware.uinput.enable = true;

  # 将你的登录用户名加入相关用户组 (请替换 <your-username>)
  users.users."${env_settings.user_name}" = {
    extraGroups = [
      "input"
      "uinput"
      "video"
    ];
  };

  # 3. Niri / Wayland 抓屏支持栈 (xdg-desktop-portal + PipeWire)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # 4. 局域网自动发现 (mDNS / Bonjour)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };

}
