{ config, pkgs, ... }:

{
  ##################################
  # Global Package Configuration
  ##################################
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cantarell-fonts
    cifs-utils
    curl
    discord
    efibootmgr
    gnome-shell-extensions
    gnome-software
    gnome-terminal
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.daily-bing-wallpaper
    gnomeExtensions.dash-to-panel
    google-chrome
    gsettings-desktop-schemas
    hdparm
    jq
    kubectl
    kubectx
    minecraft-launcher
    nautilus
    neofetch
    parted
    screenfetch
    steam
    tailscale
    vim
    vscode
    wget
  ];

  # Environment variables
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };

  fonts.packages = with pkgs; [ cantarell-fonts ];
}

