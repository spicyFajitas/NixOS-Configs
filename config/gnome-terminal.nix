{ config, pkgs, ... }:

{
  ##################################
  # GNOME Terminal Profile Configuration
  ##################################
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.Terminal.Legacy.Settings]
    theme-variant='system'

    [org.gnome.Terminal.Legacy.Keybindings]
    prev-tab='<Primary>Up'

    [org.gnome.Terminal.Legacy.Profiles:]
    default='7438df0e-4729-4e87-94f5-a42e01c6eaf7'
    list=['b1dcc9dd-5262-4d8d-a863-c897e6d979b9', '7438df0e-4729-4e87-94f5-a42e01c6eaf7']

    ##################################
    # Custom Profile: Testing Colors
    ##################################
    [org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:7438df0e-4729-4e87-94f5-a42e01c6eaf7/]
    audible-bell=false
    background-color='rgb(33,33,33)'
    bold-is-bright=true
    cursor-background-color='rgb(208,208,208)'
    cursor-colors-set=true
    cursor-foreground-color='rgb(0,0,0)'
    foreground-color='rgb(208,208,208)'
    highlight-background-color='rgb(93,92,156)'
    highlight-colors-set=true
    highlight-foreground-color='rgb(208,208,208)'
    use-theme-colors=false
    visible-name='Testing Colors'
    palette=['rgb(21,21,21)', 'rgb(172,65,66)', 'rgb(126,142,80)', 'rgb(229,181,103)', 'rgb(28,78,116)', 'rgb(159,78,133)', 'rgb(125,214,207)', 'rgb(208,208,208)', 'rgb(80,80,80)', 'rgb(172,65,66)', 'rgb(126,142,80)', 'rgb(229,181,103)', 'rgb(135,192,235)', 'rgb(159,78,133)', 'rgb(125,214,207)', 'rgb(245,245,245)']

    ##################################
    # Default GNOME Profile
    ##################################
    [org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/]
    background-color='rgb(23,20,33)'
    foreground-color='rgb(208,207,204)'
    use-theme-colors=true
    visible-name='Default'
    palette=['rgb(23,20,33)', 'rgb(192,28,40)', 'rgb(38,162,105)', 'rgb(162,115,76)', 'rgb(18,72,139)', 'rgb(163,71,186)', 'rgb(42,161,179)', 'rgb(208,207,204)', 'rgb(94,92,100)', 'rgb(246,97,81)', 'rgb(51,209,122)', 'rgb(233,173,12)', 'rgb(42,123,222)', 'rgb(192,97,203)', 'rgb(51,199,222)', 'rgb(255,255,255)']
  '';
}

