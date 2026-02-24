{ config, lib, pkgs, inputs, ... }:

{
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
    };

    # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)
  };

  # Niri
  programs.niri.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  }; 

  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    # 对于 Niri，gtk 是必须的（处理图标、文件选择和通知）
    # gnome 换成 gtk 可以保持系统纯净
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
    ];
  
    # 配置 Portal 的策略（告诉系统谁来处理特定的请求）
    config = {
      common = {
        default = [ "gtk" ];
      };
    };
  };

}
