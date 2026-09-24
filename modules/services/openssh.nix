{ config, pkgs, ... }:

{
  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;

    # Ports where the server will listen.
    ports = [ 22 ];

    # Advanced security settings.
    settings = {
      PermitRootLogin = "no";                  # Disables direct login to the root user (still allowed with SSH keys if prohibit-password is set).
      PasswordAuthentication = false;          # Disables password login (use SSH keys.).
      X11Forwarding = false;                   # Disable X11 forward if not needed.
      KbdInteractiveAuthentication = false;    # Allows only modern and secure login methods.
    };

    # Generate only modern host keys.
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };

}
