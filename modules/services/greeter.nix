{ pkgs, ... }:

{
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordless-sync-users = [ "rriver06" ];
    settings = {
      cursor = {
        theme = "Adwaita";
        size = 24;
        path = "${pkgs.adwaita-icon-theme}/share/icons";
      };
    };
  };

  # Allow unlocking password keyring after login
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Allow setting user profile and name
  services.accounts-daemon.enable = true;
}
