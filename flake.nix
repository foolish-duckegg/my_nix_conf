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

  outputs = {self, nixpkgs, home-manager, dms, ... }@inputs: {
    nixosConfigurations.duckegg-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { 
        inherit inputs; 
	
        # globle vars
        env_settings = import ./sys_settings.nix;
      };
      modules = [
        ./configuration.nix

         #home manager
         home-manager.nixosModules.home-manager
         {
           home-manager.useGlobalPkgs = true;
           home-manager.useUserPackages = true;
         }
         
         # DMS
         dms.nixosModules.default
         ({ pkgs, ... }: {
	   nixpkgs.overlays = [
	     (final: prev: {
	       dgop = inputs.dgop.packages.${pkgs.system}.default;
	     })
	   ];
	 })
      ];
    };
  };
}
