{

  description = "my nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # DMS
    dms.url = "github:AvengeMedia/DankMaterialShell";
    dms.inputs.nixpkgs.follows = "nixpkgs";

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      dms,
      ...
    }@inputs:
    let
      sys_settings = import ./sys_settings.nix;
    in
    {
      nixosConfigurations."${sys_settings.host_name}" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;

          # globle vars
          env_settings = import ./sys_settings.nix;
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
        ];
      };
    };
}
