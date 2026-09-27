{ config, pkgs, ... }:

let
  # Mount options for bind mounts.
  mountOptions = [
    "ro"
    "x-gvfs-hide"
    # Resolves simlinks as if they were real files.
    "resolve-symlinks"
  ];
in
{
  # Enable flatpak service.
  services.flatpak = {
    enable = true;
    update.onActivation = true;    # Update flatpaks when doing a rebuild.
    uninstallUnmanaged = true;     # Disable flatpaks not on the list.

    # Flathub repo.
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];

    # Flatpak installed list.
    # I wont add anything here until i got a proper desktop.
    packages = [
      
    ];
  };

  # Fixes for flatpak apps.
  # Bind mount fonts, icons and themes from the /run/current-system/sw/share/* paths
  # to their /usr/share/* equivalents.
  fonts.fontDir.enable = true;

  system.fsPackages = [
    pkgs.bindfs
  ];

  # Fonts.
  fileSystems."/usr/share/fonts" = {
    device = "/run/current-system/sw/share/X11/fonts";
    fsType = "fuse.bindfs";
    options = mountOptions;
  };

  # Icons.
  fileSystems."/usr/share/icons" = {
    device = "/run/current-system/sw/share/icons";
    fsType = "fuse.bindfs";
    options = mountOptions;
  };

  # Themes.
  fileSystems."/usr/share/themes" = {
    device = "/run/current-system/sw/share/themes";
    fsType = "fuse.bindfs";
    options = mountOptions;
  };

}
