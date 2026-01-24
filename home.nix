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
	pkgs.fastfetch
	pkgs.unzip
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
                rbdot = "sudo nixos-rebuild switch --flake ~/nixowos-dotfiles";
		flake = "nix flake update";
		hm = "home-manager switch --flake ~/nixowos-dotfiles";
		owo = "echo 'owO wHatZ DiS'";
		uwu = "echo 'UWu wHatZ datS'";
		garbage = "sudo nix-collect-garbage -d";
		dot = "cd ~/nixowos-dotfiles";
		gadd = "git add *";
		gdiff = "git diff";		
		gpsh = "git push github main";
		note = "nano ~/notes.pdf";
		qcm = "~/nixowos-dotfiles/shellies/quickcommit.sh";
                wid = "niri msg pick-window";
		chome = "nano ~/nixowos-dotfiles/home.nix";
		cflake = "nano ~/nixowos-dotfiles/flake.nix";
		cconfig = "nano ~/nixowos-dotfiles/configuration.nix";
	};
  };

  # Let Home Manager install and manage itself.
   programs.home-manager.enable = true;
}
