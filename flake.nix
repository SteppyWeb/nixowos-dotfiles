{
	description = "testing stuffs";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
		let
			system ="x86_64-linux";
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
			pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
			username = "thy";
###################### This is stolen from https://git.krutonium.ca/Krutonium/NixOS/src/commit/c2bbd0b21fd859e7387081b9f13e955484081eab/flake.nix
#        ({ config, pkgs, ... }:
#          {
#            nixpkgs.overlays = [ overlay-unstable ];
#          }
#        )
  #    ];
  #    # Overlays
  #    # nixpkgs-unstable
 #     overlay-unstable = final: prev: {
#        unstable = import nixpkgs-unstable {
   #       inherit system;
  #        config.allowUnfree = true;
 #     
#        };
#      };
#######################################################
		in {
			nixosConfigurations = {
				nixos = lib.nixosSystem {
					inherit system;
					modules = [ ./configuration.nix ];
					specialArgs = {
						inherit username;
						inherit pkgs-unstable;
					};
				};	
			};
			homeConfigurations = {
				thy = home-manager.lib.homeManagerConfiguration {
					inherit pkgs;
					modules = [ 
						./home.nix
					 ];
					extraSpecialArgs = {
						inherit username;
						inherit pkgs-unstable;	
					};
				};
			};
		};
	
}




