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
    gnomeExtensions.gsconnect
    gnomeExtensions.dash-to-panel
    google-chrome
    gsettings-desktop-schemas
    hdparm
    home-manager
    htop
    jq
    kubectl
    kubectx
    nautilus
    neofetch
    os-prober
    parted
    prismlauncher
    screenfetch
    steam
    tailscale
    variety
    vim
    vscode
    wget
  ];
  programs.steam.enable = true;

  home-manager.users.adam = {
    programs.home-manager.enable = true;
    home.stateVersion = "25.05";
  };

  # Environment variables
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "GNOME";
  };

  fonts.packages = with pkgs; [ cantarell-fonts ];
}

