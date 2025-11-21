{
  pkgs,
  userSettings,
  ...
}: {
  # Set your time zone.
  # Define a user account. Don't forget to change your password with ‘passwd’.
  users.users.${userSettings.userName} = {
    isNormalUser = true;
    description = userSettings.name;
    initialPassword = "password";
    extraGroups = ["networkmanager" "wheel" "input" "docker"];
    shell = pkgs.zsh;
  };
}
