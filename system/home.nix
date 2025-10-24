{ config, lib, pkgs, ... }:

{
  # Create Tabby desktop launcher
  home.file.".local/share/applications/tabby.desktop".text = ''
    [Desktop Entry]
    Name=Tabby Terminal
    Exec=${config.home.homeDirectory}/Applications/tabby.AppImage
    Icon=${config.home.homeDirectory}/Pictures/icons/tabby.png
    Type=Application
    Categories=Utility;TerminalEmulator;
    StartupNotify=true
    Comment=Modern terminal for local shells, SSH, and serial connections
  '';
}

