{ pkgs, ... }:

{
  # Disable pulseaudio
  services.pulseaudio.enable = false;

  # Enable pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  systemd.user.services.pipewire-quantum = {
    description = "Set PipeWire quantum";
    after = [ "wireplumber.service" ];
    bindsTo = [ "pipewire.service" ];
    wantedBy = [ "wireplumber.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = [
        "${pkgs.pipewire}/bin/pw-metadata -n settings 0 clock.quantum 1024"
        "${pkgs.pipewire}/bin/pw-metadata -n settings 0 clock.min-quantum 1024"
        "${pkgs.pipewire}/bin/pw-metadata -n settings 0 clock.max-quantum 1024"
      ];
    };
  };

}
