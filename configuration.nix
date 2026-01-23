{ config, lib, pkgs, ... }:
{
  
  imports = [ ./hardware-configuration.nix ];

  boot.supportedFilesystems = [ "ntfs" ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  
  # nix.gc = {
  # automatic = true:
  # dates = "weekly";
  # options = "--delete-older-than 30d";
  #};

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Enable CUPS to print documents.
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.thy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
   };

  # programs.firefox.enable = true;

  #Niri Settings
  programs.niri.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.swaylock = {};
  # programs.waybar.enable = false;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  xdg.portal.config.niri = {
     "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
  };
  nixpkgs.config.allowUnfree = true;
  services.displayManager.ly.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     git
     vivaldi
     vivaldi-ffmpeg-codecs
     #home-manager
     prismlauncher
     discord
     vscodium-fhs
     waydroid
     waydroid-helper
     libreoffice-qt-fresh
     #down is niri stuffs
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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix. 
  # no worky with flakes
  #system.copySystemConfiguration = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}

