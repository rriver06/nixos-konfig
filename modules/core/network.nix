{ lib, config, ... }:

{
  networking = {
    # Set device hostname.
    hostName = "Inspiron3501";

    # Open ports in the firewall.
    firewall.allowedTCPPorts = [ 22 ];
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

    # Configure network connections interactively with nmcli or nmtui.
    networkmanager = {
      enable = true;

      # Manual IP on home networks.
      ensureProfiles.profiles = {
        # -------------------------------------- WiFi Profiles --------------------------------------

        "Doble R" = {                                         # Network Profile Name
          connection = {
            id = "Doble R";                                   # Network Profile Name
            type = "wifi";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "Doble R";                                 # WiFi SSID Name
          };
          wifi-security = {
            key-mgmt = "wpa-psk";
            psk = config.sops.secrets.home_wifi_password.path;
          };
          ipv4 = {
            method = "manual";
            address1 = "192.168.0.176/24,192.168.0.1";        # Desired IP Address / Mask , Gateway
            dns = "1.1.1.1;8.8.8.8";
          };
        };

        "Doble R 5Ghz" = {                                    # Network Profile Name
          connection = {
            id = "Doble R 5Ghz";                              # Network Profile Name
            type = "wifi";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "Doble R 5Ghz";                            # WiFi SSID Name
          };
          wifi-security = {
            key-mgmt = "wpa-psk";
            psk = config.sops.secrets.home_wifi_password.path;
          };
          ipv4 = {
            method = "manual";
            address1 = "192.168.0.176/24,192.168.0.1";        # Desired IP Address / Mask , Gateway
            dns = "1.1.1.1;8.8.8.8";
          };
        };


        # ------------------------------------ Ethernet Profiles ------------------------------------

        "Wired connection 1" = {                              # Network Profile Name
          connection = {
            id = "Wired connection 1";                        # Network Profile Name
            type = "ethernet";
            interface-name = "enp1s0";                        # Ethernet card name
          };
          ipv4 = {
            method = "manual";
            address1 = "192.168.0.176/24,192.168.0.1";        # Desired IP Address / Mask , Gateway
            dns = "1.1.1.1;8.8.8.8";
          };
        };


      };
    };
  };

  # Allows package forwarding (needed for VMs and VPNs).
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

}
