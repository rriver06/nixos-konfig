{ pkgs, ... }:

{
  # Hardware acceleration settings for Intel CPUs.
  services.xserver.videoDrivers = [ "modesetting" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      # Uncomment this only if you must run VDPAU-only apps.
      # libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    # Uncomment only if using libvdpau-va-gl
    # VDPAU_DRIVER = "va_gl";
  };

  hardware.enableRedistributableFirmware = true;

  # May help services that have trouble accessing /dev/dri (ex. jellyfin, plex)
  # users.users.<service>.extraGroups = [ "video" "render" ];

}
