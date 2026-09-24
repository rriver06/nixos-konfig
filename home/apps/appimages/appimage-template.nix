{ pkgs, ... }:
let
  # Adding an AppImage to the system apps.
  myAppImage = pkgs.appimageTools.wrapType2 {
    pname = "program-name";
    version = "1.0";

    # To get the hash, just do
    # nix-prefetch-url https://app-link.com/file.AppImage
    src = pkgs.fetchurl {
      url = "https://github.com/someUser/program/releases/download/v1.0/program-x64.AppImage";
      hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };

    # Optional: Extra libraries (if needed by the app).
    extraPkgs = pkgs: with pkgs; [
      uudev
    ];

    # Optional: Use local icon for app .desktop.
    myIcon = pkgs.fetchurl {
      url = "https://example.com/icon.png";
      hash = "sha256-...";
    };

  };
in
{
  # -------------------------------------------------- Package Settings --------------------------------------------------

  home.packages = [
    myAppImage
  ];

  # Create the .desktop file.
  xdg.desktopEntries.program-name = {
    name = "My AppImage App";
    exec = "${myAppImage}/bin/program-name";
    icon = "application-x-executable";            # Try using the app name, like "discord" or "${myIcon}", else just leave it like that.
    categories = [ "Utility" "Development" ];
  };


  # ---------------------------------------------------- App Settings ----------------------------------------------------

}
