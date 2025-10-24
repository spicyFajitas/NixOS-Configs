{ config, pkgs, ... }:

{
  ##################################
  # Hostname and Networking
  ##################################
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Enables NetworkManager.
}

