{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.noctalia}/bin/noctalia-greeter";
        user = "greeter";
      };
    };
  };

  # Allow unlocking password keyring after login
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Allows setting user profile and name
  services.accounts-daemon.enable = true;
}
