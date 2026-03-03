{
  config,
  lib,
  pkgs,
  inputs,
  env_settings,
  ...
}:

let
  template = builtins.readFile ../resources/niri-config.kdl.tmpl;
  niri_config =
    builtins.replaceStrings [ "@output_monitor@" ] [ env_settings.display_monitor ]
      template;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    "${env_settings.user_name}" = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ]; # Enable ‘sudo’ for the user.
      hashedPassword = env_settings.passwd;
      packages = with pkgs; [
        tree
        yazi
        ueberzugpp
        ffmpegthumbnailer
        btop

        (vscode.fhsWithPackages (
          ps: with ps; [
            rustup
            zlib
          ]
        ))
      ];

      # use zsh
      shell = pkgs.zsh;
    };
  };

  # zsh
  # 启用 Zsh 模块
  programs.zsh = {
    enable = true;

    # 自动补全和语法高亮（非常推荐）
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    # 如果你想用 Oh My Zsh
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "jonathan";
    };
  };

  #home-manager
  home-manager.users = {
    "${env_settings.user_name}" =
      { pkgs, ... }:
      {

        programs = {
          # 让 home manager 接管 ~/.profile
          bash.enable = true;

          zsh = {
            enable = true;
            initContent = builtins.readFile ../resources/.zshrc;
          };

          chromium = {
            enable = true;
            extensions = [
              { id = "hfjbmagddngcpeloejdejnfgbamkjaeg"; }
              # Vimium C
              # 配置页面：chrome-extension://hfjbmagddngcpeloejdejnfgbamkjaeg/pages/options.html#commands
            ];
          };

          neovim = {
            enable = true;
            viAlias = true;
            plugins = with pkgs.vimPlugins; [
              (nvim-treesitter.withPlugins (
                p: with p; [
                  nix
                  lua
                  python
                  cpp
                  json
                  java
                  html
                  css
                  bash
                  c
                  javascript
                  markdown
                  markdown_inline
                  yaml
                  toml
                  regex
                ]
              ))
              kanagawa-nvim
              lualine-nvim
              nvim-web-devicons
              nvim-tree-lua
              vim-tmux-navigator
              rainbow-delimiters-nvim
              comment-nvim
              nvim-autopairs
              bufferline-nvim
              gitsigns-nvim
              hop-nvim
              diffview-nvim
              toggleterm-nvim
              which-key-nvim
              yazi-nvim
              mini-nvim
              nvim-cmp
              cmp-nvim-lsp
              cmp-buffer
              cmp-path
              conform-nvim
              markdown-preview-nvim
              bufdelete-nvim
              telescope-nvim
              plenary-nvim
              telescope-fzf-native-nvim
              nvim-ufo
              promise-async
            ];
            extraPackages = with pkgs; [
              # lsp
              nixd
              lua-language-server
              pyright
              clang-tools
              vscode-langservers-extracted
              nodePackages.bash-language-server
              nodePackages.typescript-language-server
              marksman
              yaml-language-server
              # jdtls

              # conform
              nixfmt-rfc-style
              stylua
              black
              clang-tools
              nodePackages.prettier
              shfmt

              # markdown-preview 需要nodejs
              nodejs

              # telescope preview
              ripgrep
              fd
            ];
          };
        };

        home = {

          # environment
          sessionPath = [
            "$HOME/.local/bin"
          ];

          file =
            let
              moran_dir = ../resources/fcitx/rime-moran;
              rime_dir = ../resources/fcitx/rime;
              rime_moran_file = lib.mapAttrs' (
                name: type:
                lib.nameValuePair ".local/share/fcitx5/rime/${name}" {
                  source = "${moran_dir}/${name}";
                }
              ) (builtins.readDir moran_dir);

              rime_file = lib.mapAttrs' (
                name: type:
                lib.nameValuePair ".local/share/fcitx5/rime/${name}" {
                  source = "${rime_dir}/${name}";
                }
              ) (builtins.readDir rime_dir);
            in
            rime_moran_file
            # // rime_file
            // {
              # fcitx
              ".local/share/fcitx5/themes" = {
                source = ../resources/fcitx/themes;
                recursive = true;
              };

              # kitty
              ".config/kitty/kitty.conf".source = ../resources/kitty.conf;

              # font
              ".local/share/fonts".source = ../resources/font;

              # fuzzel theme
              ".config/fuzzel".source = ../resources/fuzzel;

              #cursor
              ".local/share/icons".source = ../resources/cursors;

              #nvi 插件配置
              ".config/nvim/init.lua".source = ../resources/nvim/init.lua;
              ".config/nvim/lua/myconf".source = ../resources/nvim/lua/myconf;
            };
        };

        # niri config
        xdg.configFile."niri/config.kdl".text = niri_config;

        home.stateVersion = "25.11";

      };
  };
}
