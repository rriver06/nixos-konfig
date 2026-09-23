{ pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    # SSH alias / hosts configuration.
    settings = {
      "home-server" = {                        # Data here is from host machine you're going to SSH into.
        hostname = "192.168.0.180";    
        user = "rriver06";
        port = 22;
        Compression = true;
        identityFile = "~/.ssh/id_ed25519";    # This is the SSH key from your local machine, for identification.
      };

      # GitHub access config.
      "github.com" = {
        hostname = "github.com";    
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };

    };
  };

}
