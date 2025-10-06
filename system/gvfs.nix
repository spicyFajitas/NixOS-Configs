{ config, pkgs, ... }:

{
  ##################################
  # Enable GNOME Files (Nautilus) network browsing
  ##################################
  services.gvfs.enable = true; # Enables GNOME Virtual File System (includes smb, sftp, etc.)
  services.avahi.enable = true; # Helps discover network shares via mDNS
}

