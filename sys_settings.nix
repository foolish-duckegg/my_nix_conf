{
  # 系统版本
  sys_version = "25.11";
  # 是否带有nvidia驱动
  is_including_nvidia = false;
  # boot启动目录
  boot_device = "/dev/vda";
  # 用户名，登录时用该用户名，同时生成 /home/$user_name 的 home 目录
  user_name = "duckegg";
  # 主机名
  host_name = "duckegg-nixos";
  # Run `mkpasswd -m sha-512`.
  # Input password and click `Enter` on your keyboard.
  # Replace the default password `123456`
  passwd = "$6$YvBFxj7zFDDy8T02$Du6S.ev8SW3Eu/tpQSPyQVv44OQQInsjFfnpwZINbc0ACcXpyN7G2IjBMqzo9EmiItsa81FrqtatOw9SmqfV80";
  # 系统时区
  timeZone = "Asia/Shanghai";

  # 代理配置，若无则注释掉
  proxy_url = "socks5://192.168.122.98:10808";
  no_proxy_url = "127.0.0.1,localhost,internal.domain";

  # 显示器设置
  # 首次运行把这个赋值成一个空字串
  # 进入桌面后运行 `niri msg outputs` 查看显示器名称和支持的分辨率/刷新率
  display_monitor = ''
    output "Virtual-1" {
      mode "1920x1080@60.000"
      scale 1
      transform "normal"
      position x=0 y=0
    }


    // output "HDMI-A-1" {
    //   mode  "2560x1440@120.000"
    //   position x=1920 y=0
    // }

  '';
}
