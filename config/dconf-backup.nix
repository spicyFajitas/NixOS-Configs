{ config, lib, pkgs, ...}:

{
  system.activationScripts.myScript = {
    text = ''
      #!/bin/bash
      # run `sudo dconf load / < exported-configs/dconf/<file>` to restore dconf config
      /run/current-system/sw/bin/dconf dump / > /home/adam/Documents/code/nixos-configs/exported-configs/dconf/dconf-backup-$(echo $(date +%F-%H-%M-%S))
    '';
    # Optional: dependencies
    # deps = [ "bash" ]; # list of packages
  };

}