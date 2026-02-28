# 配置说明

这是一个 `nixos` 的 `niri` + `DMS` 的美化配置
<img src="./Screenshot.png">

## 1. 硬件配置生成

备份 `/etc/nixos` ，执行以下命令

```sh
sudo nixos-generate-config
```

生成好后检查 `/etc/nixos` 文件夹中是否存在

- `configuration.nix`
- `hardware-configuration.nix`

## 2. 修改 `sys_settings.nix` 文件

克隆仓库并按照注释修改 `sys_settings.nix`

## 3. 执行系统刷新命令

```
sudo nix-rebuild switch --flake .$[sys_settings.nix里的host_name]
```

可选参数:

- `--impare` : 把 `/etc/nixos/*onfiguration.nix` 移动到项目文件夹下，并且改 `./flake.nix` 里的 `/etc/nixos/configuration.nix` -> `./configuration.nix`，则可以不写
- `--offline` : 第二次之后执行，若没有添加新包，可以使用此参数不联网更新

## 4. 我的常用快捷键

```
这个家伙很懒，开心再写
```

## -1. 待完成

- 默认系统字体写入 `sys_settings` 里
- 软件包做成在 `sys_settings` 可配置
- `DMS` 和 `fcitx5` 有需要手动配置的内容，待补全文档

# 感谢：

### 此配置里有不少我希望持久化且不更新的设置，包括但不限于鼠标指针、字体等。所以并未直接使用 `git` 仓库。

- [hosxy/Fcitx5-Material-Color](https://github.com/hosxy/Fcitx5-Material-Color)
- [tonyfettes/fcitx5-nord](https://github.com/tonyfettes/fcitx5-nord)
- [ful1e5/Bibata_Cursor](https://github.com/ful1e5/Bibata_Cursor)
- [dracula/fuzzel](https://github.com/dracula/fuzzel)
- 大量参考[b站视频](https://www.bilibili.com/video/BV1XKrbBKEtL)
