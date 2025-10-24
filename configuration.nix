# Edit this configuration file to define what should be installed on your system.
# Help is available in the configuration.nix(5) man page and the NixOS manual (accessible via `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
      ./config/audio.nix
      ./config/bash-setup.nix
      ./config/boot.nix
      ./config/dconf-backup.nix
      ./config/git.nix
      ./config/gnome-customizations.nix
      ./config/gnome-keybindings.nix
      ./config/gnome-keyring.nix
      ./config/gnome-terminal.nix
      ./config/gnome.nix
      ./config/locale.nix
      ./config/mounts.nix
      ./config/networking.nix
      ./config/packages.nix
      ./config/services.nix
      ./config/users.nix
      ./config/vim.nix
    ];
 
  home-manager.users.adam = {
    imports = [
      ./config/home.nix
      ./config/dash-to-panel.nix
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
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gnome 
      ];
  };

  ##################################
  # System State Version
  # This value determines the NixOS release compatibility level.
  ##################################
  system.stateVersion = "25.05";
}

