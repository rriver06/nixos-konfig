{ config, pkgs, ... }:

{
  services.flatpak = {
    # enable = true;
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
}
