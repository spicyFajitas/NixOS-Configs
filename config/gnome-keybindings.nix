{ config, pkgs, lib, ... }:

{
  ##################################
  # GNOME Custom Keyboard Shortcuts
  ##################################

  # This uses gsettings overrides so it persists across reboots.
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.settings-daemon.plugins.media-keys]
    custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']

    [org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/]
    name='Screenshot (Super+Shift+S)'
    command='gnome-screenshot -a'
    binding='<Super><Shift>S'
  '';
}

