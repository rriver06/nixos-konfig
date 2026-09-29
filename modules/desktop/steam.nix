{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extest.enable = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      hidapi
      jdk
    ];

    # Fix Gamescope not launching due to missing Xorg libraries.
    package = pkgs.steam.override {
      extraPkgs = pkgs': with pkgs'; [
        libXcursor
        libXi
        libXinerama
        libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };

  };

  # Enable gamemode.
  programs.gamemode.enable = true;

  # Enable gamescope.
  programs.gamescope = {
    enable = true;
    capSysNice = false;    # Enables HDR support.
  };

  # Enable the XBOX Controller USB dongle.
  hardware.xone.enable = true;
  hardware.uinput.enable = true;

}
