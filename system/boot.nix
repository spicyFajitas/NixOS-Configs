{ config, pkgs, ... }:

{
  ##################################
  # Bootloader and Disk Encryption
  ##################################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-c51c4979-0b74-4edd-a41b-c18dde777470".device =
    "/dev/disk/by-uuid/c51c4979-0b74-4edd-a41b-c18dde777470";
}

