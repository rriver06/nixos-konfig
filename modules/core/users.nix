{ ... }:

{
  # Disable system user modifications (declare everything on this file).
  users.mutableUsers = false;

  # Define some root account settings
  users.users.root = {
    hashedPasswordFile = config.sops.secrets.root_password.path;
  };

  # Define the user account settings.
  # Remember to check the username.
  users.users.rriver06 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    hashedPasswordFile = config.sops.secrets.shadow_password.path;
  };

}
