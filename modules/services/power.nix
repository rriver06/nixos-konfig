{ ... }:

{
  # Enable power profiles and battery monitoring.
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
