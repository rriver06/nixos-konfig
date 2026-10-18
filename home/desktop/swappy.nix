{ ... }:

{
  xdg.configFile."swappy/config".text = ''
    [Default]
    save_dir=$HOME/Pictures/Screenshots
    save_filename_format=Screenshot From %Y-%m-%d %H-%M-%S.png
    show_desktop_notification=true
    early_save_exit=false
  '';
}
