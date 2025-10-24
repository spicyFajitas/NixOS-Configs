{ config, lib, pkgs, ...}:

{
  # Create Tabby desktop launcher
  home.file.".local/share/applications/tabby.desktop".text = ''
    [Desktop Entry]
    Name=Tabby Terminal
    Exec=${config.home.homeDirectory}/Applications/tabby.AppImage --no-sandbox
    Icon=${config.home.homeDirectory}/Pictures/icons/tabby.png
    Type=Application
    Categories=Utility;TerminalEmulator;
    StartupNotify=true
    Comment=Modern terminal for local shells, SSH, and serial connections
  '';

  # GNOME settings
  dconf.settings = {
    "org/gnome/control-center" = {
      last-panel = "mouse";
      window-state = "(980, 640, true)";
    };

    "org/gnome/desktop/interface" = {
      accent-color = "blue";
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      speed = -0.7;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/shell" = {
      app-picker-layout = ''
        [{'65808f86-b22a-405a-89f7-489901e41077': <{'position': <0>}>, 'Utilities': <{'position': <1>}>, 'System': <{'position': <2>}>, 'nixos-manual.desktop': <{'position': <3>}>, 'steam.desktop': <{'position': <4>}>}]
      '';
      command-history = [ "R" "r" ];
      enabled-extensions = [
        "dash-to-panel@jderose9.github.com"
        "appindicatorsupport@rgcjonas.gmail.com"
      ];
      favorite-apps = [
        "google-chrome.desktop"
        "org.gnome.Nautilus.desktop"
        "tabby.desktop"
        "code.desktop"
        "org.gnome.Settings.desktop"
        "steam.desktop"
      ];
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "48.2";
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Shift><Super>s" ];
    };

    "org/gnome/terminal/legacy/profiles:" = {
      list = [ "7438df0e-4729-4e87-94f5-a42e01c6eaf7" ];
    };

    "org/gnome/terminal/legacy/profiles:/:7438df0e-4729-4e87-94f5-a42e01c6eaf7" = {
      audible-bell = false;
      background-color = "rgb(33,33,33)";
      bold-is-bright = true;
      cursor-background-color = "rgb(208,208,208)";
      cursor-colors-set = true;
      cursor-foreground-color = "rgb(0,0,0)";
      foreground-color = "rgb(208,208,208)";
      highlight-background-color = "rgb(93,92,156)";
      highlight-colors-set = true;
      highlight-foreground-color = "rgb(208,208,208)";
      palette = [
        "rgb(21,21,21)"
        "rgb(172,65,66)"
        "rgb(126,142,80)"
        "rgb(229,181,103)"
        "rgb(28,78,116)"
        "rgb(159,78,133)"
        "rgb(125,214,207)"
        "rgb(208,208,208)"
        "rgb(80,80,80)"
        "rgb(172,65,66)"
        "rgb(126,142,80)"
        "rgb(229,181,103)"
        "rgb(135,192,235)"
        "rgb(159,78,133)"
        "rgb(125,214,207)"
        "rgb(245,245,245)"
      ];
      use-theme-colors = false;
      visible-name = "Testing Colors";
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      sidebar-width = 140;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
      window-size = "(867, 326)";
    };
  };
}