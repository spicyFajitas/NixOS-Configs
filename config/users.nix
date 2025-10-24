{ config, pkgs, ... }:

{
  ##################################
  # User Accounts
  ##################################
  users.users.adam = {
    isNormalUser = true;
    description = "spicyFajitas";
    extraGroups = [ "networkmanager" "wheel" ]; # Enable ‘sudo’ for the user.
  };
}

