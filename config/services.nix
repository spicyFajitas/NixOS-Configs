{

  # PackageKit (software updates & management backend)
  services.packagekit.enable = true;

  # tailscale
  services.tailscale.enable = true;

  # printing
  services.printing.enable = true;

  # nautilus file browser network browsing
  services.gvfs.enable = true; # Enables GNOME Virtual File System (includes smb, sftp, etc.)
  services.avahi.enable = true; # Helps discover network shares via mDNS
  services.udisks2.enable = true;
  
}

