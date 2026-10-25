{

  description = "my nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # DMS
    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs-unstable";
    dms.inputs.quickshell.follows = "quickshell";

    #quickshell
    quickshell.url = "github:quickshell-mirror/quickshell";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # nix-flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      dms,
      quickshell,
      nixpkgs-unstable,
      ...
    }@inputs:
    let
      sys_settings = import /etc/nixos/sys_settings.nix;
      sy = "x86_64-linux";
      unstable = import nixpkgs-unstable {
        inherit sy;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations."${sys_settings.host_name}" = nixpkgs.lib.nixosSystem {
        system = sy;
        specialArgs = {
          inherit inputs unstable;

          # globle vars
          env_settings = sys_settings;
        };
        modules = [
          /etc/nixos/configuration.nix

          ./mod/desktop.nix
          ./mod/systemconfig.nix
          ./mod/user.nix
          ./mod/packages.nix
          ./mod/language.nix
          ./mod/nvidia.nix

          # 可选包
          ./mod/developing-packs.nix
          ./mod/games-packs.nix
          ./mod/living-packs.nix
          ./mod/servers-packs.nix
          ./mod/academic-packs.nix

          #home manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }

          # DMS
          dms.nixosModules.default
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [
                (final: prev: {
                  dgop = inputs.dgop.packages.${pkgs.system}.default;
                })
              ];
            }
          )

          # quickshell
          ({ pkgs, ... }: {
            # quickshell
            nixpkgs.overlays = [
              quickshell.overlays.default
            ];
          })
        ];
      };
    };
}
