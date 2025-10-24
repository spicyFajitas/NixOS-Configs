# Edit this configuration file to define what should be installed on your system.
# Help is available in the configuration.nix(5) man page and the NixOS manual (accessible via `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
      ./system/audio.nix
      ./system/bash-setup.nix
      ./system/boot.nix
      ./system/dconf-settings.nix
      ./system/git.nix
      ./system/gnome-customizations.nix
      ./system/gnome-keybindings.nix
      ./system/gnome-keyring.nix
      ./system/gnome-terminal.nix
      ./system/gnome.nix
      ./system/locale.nix
      ./system/mounts.nix
      ./system/networking.nix
      ./system/packages.nix
      ./system/services.nix
      ./system/users.nix
      ./system/vim.nix
    ];
 
  home-manager.users.adam = {
    imports = [
      ./system/home.nix
      # ./system/dconf-settings.nix
    ];
  };
 
  environment.sessionVariables = {
    GTK_USE_PORTAL = "0";
  };

  ##################################
  # XDG Portals (used for file pickers, screenshots, screen share, etc.)
  ##################################
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };


  ##################################
  # System State Version
  # This value determines the NixOS release compatibility level.
  ##################################
  system.stateVersion = "25.05";
}

