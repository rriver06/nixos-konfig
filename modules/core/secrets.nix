{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    # System SSH key (needed for decryption).
    # I personally save it on my home directory (check username).
    age.sshKeyPaths = [
      "/home/rriver06/.ssh/id_ed25519"
      "/persist/etc/ssh/ssh_host_ed25519_key" 
    ];

    secrets = {
      # Secrets needed before system mount.
      "shadow_password" = {
        neededForUsers = true;
      };
      "root_password" = {
        neededForUsers = true;
      };

      # Normal secrets
      "home_wifi_password" = { owner = "rriver06"; };
      "server_ssh_pubkey" = { owner = "rriver06"; mode = "0400"; };

    };
  };

}
