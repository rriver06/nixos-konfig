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

      ensureProfiles.profiles = {
        # Manual IP for ethernet

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


  # Manual IP for WiFi
  sops.templates."Doble R.nmconnection" = {
    path = "/etc/NetworkManager/system-connections/Doble R.nmconnection";
    mode = "0600";
    content = ''
      [connection]
      id=Doble R
      uuid=89ba0b63-f0cc-3751-bbf2-7d97758333e1
      type=wifi
      interface-name=wlp0s20f3

      [wifi]
      mode=infrastructure
      ssid=Doble R

      [wifi-security]
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder.home_wifi_password}

      [ipv4]
      method=manual
      address1=192.168.0.176/24
      gateway=192.168.0.1
      dns=1.1.1.1;8.8.8.8
    '';
  };

  sops.templates."Doble R 5Ghz.nmconnection" = {
    path = "/etc/NetworkManager/system-connections/Doble R 5Ghz.nmconnection";
    mode = "0600";
    content = ''
      [connection]
      id=Doble R 5Ghz
      uuid=29240a02-a120-4442-b3e7-e9fefbdf56b2
      type=wifi
      interface-name=wlp0s20f3

      [wifi]
      mode=infrastructure
      ssid=Doble R 5Ghz

      [wifi-security]
      key-mgmt=wpa-psk
      psk=${config.sops.placeholder.home_wifi_password}

      [ipv4]
      method=manual
      address1=192.168.0.176/24
      gateway=192.168.0.1
      dns=1.1.1.1;8.8.8.8;
    '';
  };


  # Allows package forwarding (needed for VMs and VPNs).
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

}
