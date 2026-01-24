{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot = {
  	supportedFilesystems = [ "ntfs" ];
  	loader.systemd-boot.enable = true;
  	loader.efi.canTouchEfiVariables = true;
  	kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "nixos"; # Define your hostname.
  
  #nix.gc = {
  #        automatic = true;
  #        dates = "weekly";
  #        options = "--delete-older-than 30d";
  #};

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Los_Angeles";

  services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.thy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "seat" ]; 
  };
  
  nixpkgs.config.allowUnfree = true;
  
  services.displayManager.ly.enable = true;
  # services.greetd.useTextGreeter = true;
  # services.displayManager.lemurs.enable = true;


  programs.firefox.enable = true;

  #Niri Settings
  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {
  #	...;
  };
  programs.waybar.enable = false;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal.config.niri = {
     "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };
  
  virtualisation.waydroid = {
	enable = true;
	package = pkgs.waydroid-nftables;
  };
  
  programs.zoxide = {
	enable = true;
	enableBashIntegration = true;
  };

  programs.fzf = {
	keybindings = true;
	fuzzyCompletion = true;
  };

  services.emacs = {
	enable = true;
  #	...
  };

  # move stuff to home manager
  environment.systemPackages = with pkgs; [
	vim
	wget
	git
	vivaldi
	vivaldi-ffmpeg-codecs
	home-manager
	prismlauncher
	discord
	vscodium-fhs
	waydroid-helper
	libreoffice-qt-fresh
	superfile
	psmisc
	pciutils
	cowsay
	lolcat
  #down is niri stuffs move to flake or home manager
	alacritty
	fuzzel
	swaylock
	mako
	swayidle
	xwayland-satellite
	nemo
  ];

  fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.11"; 
}

