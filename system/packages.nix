{ config, pkgs, ... }:

{
  ##################################
  # Global Package Configuration
  ##################################
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim-full
    wget
    google-chrome
    gnome-shell-extensions
    gnome-software
    gnome-terminal
    gnome-tweaks
    gnomeExtensions.dash-to-panel
    nautilus
    cantarell-fonts
    vscode
    discord
    gnomeExtensions.bing-wallpaper-changer
    screenfetch
    neofetch
    cifs-utils
    curl
    jq
    steam
    gsettings-desktop-schemas
    gnomeExtensions.appindicator
  ];

  # Environment variables
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };

  fonts.packages = with pkgs; [ cantarell-fonts ];
}

