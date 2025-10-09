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

  boot.loader.grub.extraEntries = ''
    menuentry "Ubuntu (Encrypted)" {
      # Load cryptographic modules
      insmod crypto
      insmod cryptodisk
      insmod luks
      insmod gcry_rijndael
      insmod gcry_sha256
      insmod ext2

      # Search for and unlock the encrypted partition by UUID
      set root_uuid="629b57d8-dab1-4f35-927e-72401a65ecb7"  # Replace with the encrypted partition's UUID
      cryptomount -u $root_uuid

      # Set the root to the decrypted logical volume (if using LVM) or partition
      set root='(ubuntu--vg-ubuntu--lv)' # Replace with your LVM volume group and logical volume name

      # Load the kernel and initrd from the decrypted partition
      linux /boot/vmlinuz root=/dev/mapper/ubuntu--vg-ubuntu--lv # Adjust root= if not using LVM
      initrd /boot/initrd.img
    }
  '';

  boot.initrd.luks.devices."luks-c51c4979-0b74-4edd-a41b-c18dde777470".device =
    "/dev/disk/by-uuid/c51c4979-0b74-4edd-a41b-c18dde777470";
}

