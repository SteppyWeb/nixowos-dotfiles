Here are my dotfiles for NixOs :)
This is mainly to track my settings so I don't mess up my system and die ;)
So far things are still kinda ugly but I am working on it.

I am a beginner so I don't know much about the NixOs language, nor much about any programing language for that matter, so things are probably very messy and unorganized.
I enjoyed using the niri wayland compositor when I was using arch and had a hard time figuring out how to have it in NixOs and almost gave up on it
but I managed to figure it out.  I was following tutorials and copying someone else's settings and it turns out that it was in conflict with enabling niri somehow. 
Also i didn't realize i wasn't connected to the internet so it wouldn't allow me to set up flakes.... 

this repo contains the packages that I have installed as well and it is not organized so alot of them are also in the configuration.nix file


I haven't been able to use dms-shell yet because I am having trouble trying to keep things on a stable branch while but ill probably figure it out later, or else I'll just switch to configuring something else.  
I am also confused about how it works with niri when the niri flake is not being used.

Don't think anyone would want to use these configurations but if you do you'll have to change a couple things.
	*note that things are very unorganized and somethings might not work, It might be better to look at the files and copy aspects into your own files*

This Assumes that you already have NixOs installed, though I might make it easier to follow with zero knowledge
Navigate to your home directory and run the command: 

**nix-shell -p git --run "git clone https://github.com/SteppyWeb/NixOwos-Niri.git"** or simply  **"git clone https://github.com/SteppyWeb/NixOwos-Niri.git"** if you already have git installed
	*alternatively you can download the zip file under the code button, move it to the home directory, and unzip the file
	 you'll probably need something like unzip installed if you don't have another way or use the command 
	"nix-shell -p unzip --run "unzip NixOwos-Niri-main.zip" in your home directory*

Next you'll want to rename the folder to "nixos-dotfiles" if you want to be able to use the shellAliases i made, though you can go in and change the Aliases in home.nix so that they match the folder name or a folder name you choose
  a way to do that is by running the command **"mv NixOwos-Niri nixos-dotfiles"** or if you're using the unzipped file then **"NixOwos-Niri-main nixos-dotfiles"** in the home directory.
	*mv means move so we are basically moving the directory to a different name,
	the second part of the command is the name of the folder before changing it
	the last part is what you want to rename it to*

cd into the folder and modify the configuration.nix to have your user information and other such settings add any packages that you need and you can probably remove alot of other packages.  probably don't remove the packages underneath the niri comment before you configure everything to work
**Make sure to change the version number to the one you installed nix on and don't change it**  you might just want to use your own configuration.nix and  copy the settings from this one to the other and replace it in this folder.  I will try to make it less complicated in the future.
	*you might have to play around with some setting in case niri doesn't launch.*
	*in the future i might make it modular so it is easier to change things*
when finished **"rm hardware-configuration.nix"** and **"cp /etc/nixos/hardware-configuration.nix ."** to delete my hardware-configuration which is most likely different from yours and copies the one from your installation here.
you might also want to delete the flake.lock using **"rm flake.lock"** 
you might want to change many other things too. once you are done use the command **"sudo nix-rebuild switch --flake ."** in the directory and it *should* work, though I haven't really tested things hehe.



here are some helpful channels or videos about NixOs that helped me

https://www.youtube.com/@librephoenix/videos

https://www.youtube.com/watch?v=2QjzI5dXwDY

https://www.youtube.com/watch?v=nLwbNhSxLd4&pp=ygUQbml4b3MgZnVsbCBndWlkZQ%3D%3D


TODO: 
get dms shell working or give up and configure something else
I think just change shellAliases to follow shell scripts so i don't have to reboot




