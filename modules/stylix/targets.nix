# Note: These are manually defined targets for home manager only installs!
{lib, ...}: {
  stylix = {
    autoEnable = lib.mkForce false;
    targets = {
      nixvim.enable = true;
      tmux.enable = true;
      yazi.enable = true;
    };
  };
}
