{ config, pkgs, ... }:

{
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    ##################################
    # Interface & Theme
    ##################################
    [org.gnome.desktop.interface]
    color-scheme='prefer-dark'
    clock-format='12h'
    clock-show-date=true
    clock-show-weekday=true
    enable-hot-corners=false

    ##################################
    # Input & Mouse
    ##################################
    [org.gnome.desktop.peripherals.mouse]
    speed=-0.7

    [org.gnome.desktop.peripherals.touchpad]
    two-finger-scrolling-enabled=true

    ##################################
    # Time & Date
    ##################################
    [org.gnome.desktop.datetime]
    automatic-timezone=true

    ##################################
    # Wallpaper (placeholder for Bing service)
    ##################################
    [org.gnome.desktop.background]
    picture-options='zoom'
    color-shading-type='solid'
    primary-color='#000000'
    secondary-color='#000000'

    ##################################
    # GNOME Shell Behavior
    ##################################
    [org.gnome.shell]
    favorite-apps=['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Calendar.desktop', 'discord_discord.desktop', 'steam.desktop', 'org.remmina.Remmina.desktop']
    disabled-extensions=['clipboard-indicator@tudmotu.com']
    last-selected-power-profile='power-saver'
    remember-mount-password=false
    enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com','ubuntu-dock@ubuntu.com','ding@rastersoft.com','tiling-assistant@ubuntu.com']


    ##################################
    # Keybindings
    ##################################
    [org.gnome.shell.keybindings]
    show-screenshot-ui=['<Shift><Super>s']

    [org.gnome.desktop.wm.keybindings]
    close=['<Super>q']

    ##################################
    # File Chooser Defaults
    ##################################
    [org.gtk.settings.file-chooser]
    show-hidden=true
    sort-directories-first=true
    sort-order='ascending'
    view-type='grid'
  '';
}

