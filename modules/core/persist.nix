{ ... }:

{
  # Declare initrd mountpoints needed on boot.
  fileSystems."/persist".neededForBoot = true;
  fileSystems."/home".neededForBoot = true;

  # Impermanence configuration.
  # Make sure this is the mount point of the @persist volume.
  #                          vvvv
  environment.persistence."/persist" = {
    hideMounts = true;                            # Hides bind mounts from utilities as 'df'.

    # System folders that should survive reboot.
    directories = [
      "/var/cache/nix-index"                      # Comma data is stored here.
      "/var/db/sudo"                              # Prevents sudo initial message from reapearing.
      "/var/lib/docker"                           # Docker data libes here.
      "/var/lib/nixos"                            # Mantains the UID/GID of the users.
      "/var/lib/systemd"                          # Saves timers, journalctl y services status.
      "/var/lib/bluetooth"                        # Synced bluetooth devices.
      "/var/lib/flatpak"                          # Flatpak apps.
      "/var/lib/libvirt"                          # QEMU/KVM Images.
      "/etc/NetworkManager/system-connections"    # Saved WiFi connections.
    ];

    # Single system files that should survive.
    files = [
      "/etc/machine-id"                           # Unique system identifier (crucial for logs and systemd).
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
    ];

    # User files and folders are saved on @home subvol so they're safe by default.
    # Root user files that should survive.
    users.root = {
      directories = [
        ".local/share/fish"
      ];

      files = [
        ".bash_history"
        ".bash_aliases"
      ];
    };
  };

  # Allows saving SSH keys created dynamically on /persist/etc/ssh
  services.openssh.hostKeys = [
    {
      path = "/persist/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";
    }
    {
      path = "/persist/etc/ssh/ssh_host_rsa_key";
      type = "rsa";
      bits = 4096;
    }
  ];

  # Allow user SSH Keys to have correct permissions after restoration.
  programs.fuse.userAllowOther = true;

}
