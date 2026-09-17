{ pkgs, ... }:

{
  # Make a clean root filesystem on each reboot.
  boot.initrd.systemd.services.rollback = {
    description = "Restore btrfs root subvolume from @fresh";
    wantedBy = [ "initrd.target" ];
    before = [ "sysroot.mount" ];
    after = [ "dev-mapper-pool\\x2droot.device" ];
    requires = [ "dev-mapper-pool\\x2droot.device" ];
    unitConfig.DefaultDependencies = "no";

    # Inject packages inside initrd
    path = with pkgs; [
      bash
      btrfs-progs
      coreutils
      findutils
      util-linux
    ]

    serviceConfig.Type = "oneshot";
    script = ''
      mkdir -p /tmp/btrfs-root
      mount -o subvolid=5 /dev/mapper/pool-root /tmp/btrfs-root

      # Move old roots to a separate folder (if present)
      if [ -e /tmp/btrfs-root/@ ]; then
        mkdir -p /tmp/btrfs-root/old_roots
        timestamp=$(date --date="@$(stat -c %Y /tmp/btrfs-root/@)" +%Y-%m-%d_%H:%M:%S)
        mv /tmp/btrfs-root/@ "/tmp/btrfs-root/old_roots/$timestamp"
      fi

      # Delete roots older than 30 days.
      delete_subvolume_recursively() {
        local subvol="$1"
        # Delete anidated subvols (if present).
        btrfs subvolume list -o "$subvol" | cut -f 9- -d ' ' | sort -r | while read child; do
          btrfs subvolume delete "/tmp/btrfs-root/$child"
        done
        btrfs subvolume delete "$subvol"
      }

      for subvol in $(find /tmp/btrfs-root/old_roots/ -maxdepth 1 -mindepth 1); do
        delete_subvolume_recursively "$subvol"
      done

      # Create an editable copy based on clean @fresh subvol.
      btrfs subvolume snapshot /tmp/btrfs-root/@fresh /tmp/btrfs-root/@

      umount /tmp/btrfs-root
    '';
  };

}
