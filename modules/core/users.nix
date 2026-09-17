{ ... }:

{
  # Disable system user modifications (declare everything on this file).
  users.mutableUsers = false;

  # Define some root account settings
  users.users.root = {
    hashedPasswordFile = "/persist/root-password";
  };

  # Define the user account settings.
  # Remember to check the username.
  users.users.rriver06 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    hashedPasswordFile = "/persist/shadow-password";
  };

}
