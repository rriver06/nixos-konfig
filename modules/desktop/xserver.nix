{ ... }:

{
  # Enables the graphical backend.
  services.xserver = {
    enable = false;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };

  # Configure keymap in desktop.
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
}
