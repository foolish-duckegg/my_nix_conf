{
  sys_version = "25.11";
  user_name = "duckegg";
  # Run `mkpasswd -m sha-512`. 
  # Input password and click `Enter` on your keyboard. 
  # Replace the default password `123456`
  passwd = "$6$YvBFxj7zFDDy8T02$Du6S.ev8SW3Eu/tpQSPyQVv44OQQInsjFfnpwZINbc0ACcXpyN7G2IjBMqzo9EmiItsa81FrqtatOw9SmqfV80";
  timeZone = "Asia/Shanghai";

  proxy_url = "socks5://192.168.122.98:10808";
  no_proxy_url = "127.0.0.1,localhost,internal.domain";
}
