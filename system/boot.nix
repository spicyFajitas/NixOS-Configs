{ config, pkgs, ... }:

{
  ##################################
  # Bootloader and Disk Encryption
  ##################################
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];       # Use EFI, not a specific disk (important)
    useOSProber = true;          # Automatically detect Ubuntu/Windows/Arch etc.
  };

  boot.initrd.luks.devices."luks-c51c4979-0b74-4edd-a41b-c18dde777470".device =
    "/dev/disk/by-uuid/c51c4979-0b74-4edd-a41b-c18dde777470";
}

