{ config, pkgs, ... }:

{
  ##################################
  # GNOME Keyring Integration
  ##################################
  services.gnome.gnome-keyring.enable = true;

  # PAM integration for automatic unlock on login
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # Keyring environment for Chrome integration
  environment.sessionVariables = {
    CHROME_DEFAULT_KEYRING = "login";
    PASSWORD_STORE = "gnome-libsecret";
    GOOGLE_DEFAULT_KEYRING = "login";
  };
}

