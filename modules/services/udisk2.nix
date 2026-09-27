{ pkgs, ... }:

{
  # Udisk service (automount USB devices).
  services.udisks2.enable = true;
  # Enable gnome virtual file system.
  services.gvfs.enable = true;
}
