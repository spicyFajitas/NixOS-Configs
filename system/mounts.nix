{ config, pkgs, ... }:

{
  ##################################
  # Auto-mount SMB Share
  ##################################
  fileSystems."/mnt/Habanero" = {
    device = "//10.100.10.15/Habanero";
    fsType = "cifs";
    options = [
      "rw"
      "vers=3.0"
      "uid=0"
      "gid=0"
      "file_mode=0664"
      "dir_mode=0775"
      "credentials=/root/habanero-smb-secrets"
      "x-systemd.automount"
      "noauto"
      "nofail"
    ];
  };
}

