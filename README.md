Here are my dotfiles for NixOs :)
This is mainly to track my settings so I don't mess up my system and die ;)

I am a beginner so I don't know much about the NixOs language, nor much about any programing language for that matter, so things are probably very messy and unorganized.
I enjoyed using the niri wayland compositor when I was using arch and had a hard time figuring out how to have it in NixOs and almost gave up on it
but I managed to figure it out.  I was following tutorials and copying someone else's settings and it turns out that it was in conflict with enabling niri somehow. 
Also i didn't realize i wasn't connected to the internet so it wouldn't allow me to set up flakes.

this repo contains the packages that I have installed as well and it is not organized so alot of them are also in the configuration.nix file


I haven't been able to use dms-shell yet because I am having trouble trying to keep things on a stable branch while but ill probably figure it out later, or else I'll just switch to configuring something else.  
I am also confused about how it works with niri when the niri flake is not being used.

Don't think anyone would want to use these configurations but if you do you'll have to change a couple things.
	*note that things are very unorganized and somethings might not work, It might be better to look at the files and copy aspects into your own files*
First have git installed, navigate to your home directory, clone the repo using "git clone https://github.com/SteppyWeb/NixOwos-Niri.git"
	*alternatively you can download the zip file under the code button and unzip the file you'll probably need something like 7zip if you don't have a file manager that can do that*
nix-shell -p unzip --run "unzip NixOwos-Niri-main.zip"

next you'll want to rename the folder to nixos-dotfiles if you want to be able to use the shellAliases i made, though you can go in and change the Aliases so that they match the folder name or a folder name you choose
anyway a way you can do that is "mv NixOwos-Niri nixos-dotfiles" 
then you want to modify the configuration.nix file in the nixos-dofiles folder to replace your user settings as well adding other things that you want from your original configuration.nix
	*in the future i might make it modular so it is easier to change things*


here are some helpful channels or videos about NixOs

https://www.youtube.com/@librephoenix/videos

https://www.youtube.com/watch?v=2QjzI5dXwDY

https://www.youtube.com/watch?v=nLwbNhSxLd4&pp=ygUQbml4b3MgZnVsbCBndWlkZQ%3D%3D


TODO: 
get dms shell working or give up and configure something else
I think just change shellAliases to follow shell scripts so i don't have to reboot




