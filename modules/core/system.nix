{ lib, ... }:

{
  # ---------------------------------------------------------------------
  #                               NETWORK
  # ---------------------------------------------------------------------

  networking = {
    # Set device hostname.
    hostName = "Inspiron3501";

    # Configure network connections interactively with nmcli or nmtui.
    networkmanager.enable = true;

    # Manual IP settings for home networks.
    # I'll set this up later.

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or enable/disable the firewall altogether.
    firewall.enable = true;

    # Allow VMs to get through the firewall
    firewall.checkReversePath = "loose";

    # Enable DHCP as a default value.
    useDHCP = lib.mkDefault true;

    # Configure network proxy if necessary.
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  # Allows package forwarding (needed for VMs and VPNs).
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };


  # ---------------------------------------------------------------------
  #                           TIME & LOCALES
  # ---------------------------------------------------------------------

  # Set your time zone.
  time.timeZone = "America/Caracas";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Custom console options.
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };


  # ---------------------------------------------------------------------
  #                              SYSTEM
  # ---------------------------------------------------------------------

  # Enable sudo.
  security.sudo.enable = true;

  # Enable pwfeedback on terminal.
  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
