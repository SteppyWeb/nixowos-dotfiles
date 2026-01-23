{ config, pkgs, ... }:

{
#  imports = [
#	inputs.niri.homeModules.niri
#	inputs.dms.homeModules.dank-material-shell
#	inputs.dms.homeModules.niri
#  ];


  home.username = "thy";
  home.homeDirectory = "/home/thy";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
   	pkgs.neovim
	pkgs.ripgrep
	pkgs.nil
	pkgs.nixpkgs-fmt
	pkgs.nodejs
	pkgs.gcc
	pkgs.tree
	pkgs.krita
  ];
  
  home.sessionVariables = {
     EDITOR = "emacs";
  };
  
 # programs.dank-material-shell = {
#	enable = true;
#	niri.includes  = {
#		enable = true;
#		override = true;
#		originalFileName = "hm";
#		filesToInclude = [
#			"alttab"
#			"binds"
#			"colors"
#			"layout"
#			"outputs"
#			"wpblur"
#		];
#	};
 #};

  programs.git = {
	enable = true;
	settings = {
		init.defaultBranch = "main";
		user.name = "Stephanie";
		user.email = "stephiestorage@gmail.com";
		pull.rebase = false; 
	};
  };

  programs.bash = {
	enable = true;
  	shellAliases = {
		ll = "ls -l";
		".." = "cd ..";
		btw = "echo i use nixos, btw";
                rebuild = "sudo nixos-rebuild switch --flake .";
                rbdot = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles";
		flake = "nix flake update";
		hm = "home-manager switch --flake ~/nixos-dotfiles";
		owo = "echo 'owO wHatZ DiS'";
		uwu = "echo 'UWu wHatZ datS'";
		garbage = "sudo nix-collect-garbage -d";
		dot = "cd ~/nixos-dotfiles";
		dpsh = "git push github main";
	};
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
}
