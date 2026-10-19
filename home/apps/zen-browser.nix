{ pkgs, ... }:

{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];
  };
}
