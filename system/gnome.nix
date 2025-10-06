{ config, pkgs, ... }:

{
  ##################################
  # Display: GNOME Desktop on Wayland
  ##################################
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb.layout = "us";

  ##################################
  # GNOME Customization and Appearance
  ##################################
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.shell]
    enabled-extensions=['dash-to-panel@jderose9.github.com']

    [org.gnome.shell.extensions.dash-to-panel]
    panel-position='TOP'
    panel-size=36
    transparency-mode='FIXED'
    intellihide=false
    hide-top-panel=false
    show-apps-icon=true
    multi-monitor=true
    panel-element-positions='{"left": ["showAppsButton"], "center": ["taskbar"], "right": ["systemMenu", "dateMenu"]}'

    [org.gnome.desktop.wm.preferences]
    button-layout='appmenu:minimize,maximize,close'

    [org.gnome.desktop.interface]
    color-scheme='prefer-dark'

    [org.gnome.desktop.interface]
    clock-format='12h'
  '';
}

