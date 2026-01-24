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

  zramSwap = {
	enable = true;
	priority = 100;
	algorithm = "lz4";
	memoryPercent = 50;
  };



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
​  services.udev.extraHwdb = ''
evdev:atkbd:dmi:bvn*:bvr*:bd*:svn[sS][aA][mM][sS][uU][nN][gG]*:sku*SCAI*:*
 KEYBOARD_KEY_81=!esc
 KEYBOARD_KEY_ce=!prog1                                 # Fn+F1 launch settings
 KEYBOARD_KEY_76=f21                                    # Fn+F5 Touchpad toggle
 KEYBOARD_KEY_ae=!volumedown                            # Fn+F7 volume down
 KEYBOARD_KEY_b0=!volumeup                              # Fn+F8 volume up
 KEYBOARD_KEY_ac=unknown                                # Fn+F9 multi-level keyboard backlight tog>
 KEYBOARD_KEY_9f=unknown                                # Fn+F10 Camera and microphone toggle - ha>
 KEYBOARD_KEY_a8=!unknown                               # Fn+F12 Fn lock On - handled by hardware
 KEYBOARD_KEY_a9=!unknown                               # Fn+F12 Fn lock Off - handled by hardware
 KEYBOARD_KEY_8f=!unknown                               # Notification that battery has met charge>
'';


  system.stateVersion = "25.11"; 
}

