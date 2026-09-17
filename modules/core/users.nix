{ ... }:

{
  # Define the user account. Don't forget to set a password with ‘passwd <user>’.
  # Remember to check the username.
  users.users.rriver06 = {
    isNormalUser = true;
    initialPassword = "123456";                                    # Remember to change the password on first boot.
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

}