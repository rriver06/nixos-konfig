{ pkgs, ... }:
let
  # Adding an AppImage to the system apps.
  # To get the hashes, just do
  # nix store prefetch-file https://app-link.com/file.AppImage
  newAppImage = pkgs.fetchurl {
    url = "https://github.com/patchzyy/Wiicompiled/releases/download/v0.2.34/WiiCompiled-Setup-x86_64.AppImage";
    hash = "sha256-fOrUVcom55bQ8xK/TGvYA3w9a2Ob/uf48GMuI52Hcmg=";
  };

  # Create a clean binary
  yourProgram = pkgs.writeShellScriptBin "your-program" ''
    exec ${pkgs.appimage-run}/bin/appimage-run ${newAppImage} "$@"
  '';

  # Optional: Use local icon for app .desktop.
  yourProgramIcon = pkgs.fetchurl {
    url = "https://cdn2.steamgriddb.com/icon/4f2a74539bfe86a8a98d4fcfb0d26a6f.png";
    hash = "sha256-nXZRXF01IwuROe9NHpvfM8KLSpUr7YzYXH3cJOK3X10=";
  };

in
{
  # -------------------------------------------------- Package Settings --------------------------------------------------

  home.packages = [
    yourProgram
  ];

  # Create the .desktop file.
  xdg.desktopEntries."your-program" = {
    name = "A new program";
    exec = "your-program";
    icon = "${yourProgramIcon}";
    categories = [ "Games" "Etc" ];
    comment = "A description of your app.";
  };


  # ---------------------------------------------------- App Settings ----------------------------------------------------

}
