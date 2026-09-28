{ ... }:

{
  services.logind.settings.Login = {
    # Closing the lid on battery.
    HandleLidSwitch = "suspend";

    # Closing the lid while plugged in.
    HandleLidSwitchExternalPower = "lock";

    # Closing the lid while using an external display.
    HandleLidSwitchDocked = "ignore";
  };
}
