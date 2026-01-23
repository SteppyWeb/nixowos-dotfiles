{
	description = "testing stuffs";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-25.11";
		nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
#		dms = {
#			url = "github:AvengeMedia/DankMaterialShell/stable";
#			inputs.nixpkgs.follows = "nixpkgs-unstable"; 
#		};
	};
	
	outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
		let
			system ="x86_64-linux";
			lib = nixpkgs.lib;
			pkgs = nixpkgs.legacyPackages.${system};
			pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
			username = "thy";
		in {
			nixosConfigurations = {
				nixos = lib.nixosSystem {
					inherit system;
					modules = [ 
						./configuration.nix
						home-manager.nixosModules.home-manager {
							home-manager.useGlobalPkgs = true;
							home-manager.useUserPackages = true;
							home-manager.users.thy = import ./home.nix;
							home-manager.backupFileExtension = "backup";
						}
					 ];
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




