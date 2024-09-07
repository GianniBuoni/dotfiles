{
  inputs,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs systemSettings userSettings;};
    users.${userSettings.userName} = import ../home;
    backupFileExtension = "bak";
  };
}
