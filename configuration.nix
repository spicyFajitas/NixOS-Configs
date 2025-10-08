# Edit this configuration file to define what should be installed on your system.
# Help is available in the configuration.nix(5) man page and the NixOS manual (accessible via `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
     
      ./system/boot.nix
      ./system/bash-setup.nix
      ./system/locale.nix
      ./system/networking.nix
      ./system/users.nix
      ./system/packages.nix
      ./system/vim.nix
      ./system/git.nix
      ./system/mounts.nix
      ./system/audio.nix
      ./system/printing.nix
      ./system/gnome.nix
      ./system/gvfs.nix
      ./system/gnome-keybindings.nix
      ./system/gnome-customizations.nix
      ./system/gnome-terminal.nix
      ./system/gnome-keyring.nix
      ./system/services.nix
    ];

  ##################################
  # XDG Portals (used for file pickers, screenshots, screen share, etc.)
  ##################################
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };

  ##################################
  # PackageKit (software updates & management backend)
  ##################################
  services.packagekit.enable = true;

  ##################################
  # System State Version
  # This value determines the NixOS release compatibility level.
  ##################################
  system.stateVersion = "25.05"; # Did you read the comment?
}

