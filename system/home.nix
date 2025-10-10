{ config, lib, pkgs, ... }:

{
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
        "org.gnome.Terminal.desktop"
        "discord.desktop"
        "code.desktop"
        "org.gnome.Settings.desktop"
      ];
      remember-mount-password = false;
      welcome-dialog-last-shown-version = "48.2";
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 8;
      appicon-padding = 4;
      dot-position = "LEFT";
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      extension-version = 68;
      global-border-radius = 0;
      group-apps = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      isolate-monitors = true;
      isolate-workspaces = true;
      multi-monitors = true;
      overview-click-to-exit = false;
      panel-anchors = ''
        {"AOC-0x0003ae3f":"MIDDLE","AOC-0x0002fd34":"MIDDLE","DEL-KW14V61T5VNB":"MIDDLE"}
      '';
      panel-element-positions = ''
        {"AOC-0x0003ae3f":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":false,"position":"stackedBR"},{"element":"systemMenu","visible":false,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"AOC-0x0002fd34":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":false,"position":"stackedBR"},{"element":"systemMenu","visible":false,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}],"DEL-KW14V61T5VNB":[{"element":"showAppsButton","visible":true,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":false,"position":"stackedBR"},{"element":"systemMenu","visible":false,"position":"stackedBR"},{"element":"desktopButton","visible":false,"position":"stackedBR"}]}
      '';
      panel-element-positions-monitors-sync = true;
      panel-lengths = ''
        {"AOC-0x0003ae3f":35,"AOC-0x0002fd34":35,"DEL-KW14V61T5VNB":35}
      '';
      panel-positions = ''
        {"AOC-0x0003ae3f":"LEFT","AOC-0x0002fd34":"LEFT","DEL-KW14V61T5VNB":"LEFT"}
      '';
      panel-side-margins = 0;
      panel-side-padding = 0;
      panel-sizes = ''
        {"AOC-0x0003ae3f":62,"AOC-0x0002fd34":62,"DEL-KW14V61T5VNB":62}
      '';
      panel-top-bottom-margins = 0;
      panel-top-bottom-padding = 0;
      prefs-opened = false;
      primary-monitor = "AOC-0x0003ae3f";
      progress-show-count = true;
      secondarymenu-contains-appmenu = true;
      secondarymenu-contains-showdetails = false;
      show-apps-icon-file = "";
      show-apps-icon-side-padding = 8;
      show-apps-override-escape = true;
      show-favorites = true;
      show-favorites-all-monitors = false;
      show-running-apps = true;
      show-tooltip = true;
      show-window-previews = true;
      stockgs-force-hotcorner = false;
      stockgs-keep-dash = true;
      stockgs-keep-top-panel = true;
      stockgs-panelbtn-click-only = false;
      trans-bg-color = "#99c1f1";
      trans-dynamic-anim-target = 0.7;
      trans-gradient-bottom-color = "#ff7800";
      trans-gradient-top-color = "#c01c28";
      trans-gradient-top-opacity = 0.3;
      trans-panel-opacity = 0.55;
      trans-use-custom-bg = false;
      trans-use-custom-gradient = false;
      trans-use-custom-opacity = true;
      trans-use-dynamic-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
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
