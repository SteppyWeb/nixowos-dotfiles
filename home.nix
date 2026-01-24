{ config, pkgs, ... }:

{
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
		gadd = "git add *";
		gdiff = "git diff";		
		gpsh = "git push github main";
		note = "nano ~/notes.pdf";
		qcm = "~/nixos-dotfiles/shellies/quickcommit.sh";
                wid = "niri msg pick-window";
		chome = "nano ~/nixos-dotfiles/home.nix";
		cflake = "nano ~/nixos-dotfiles/flake.nix";
		cconfig = "nano ~/nixos-dotfiles/configuration.nix";
	};
  };

  # Let Home Manager install and manage itself.
   programs.home-manager.enable = true;
}
