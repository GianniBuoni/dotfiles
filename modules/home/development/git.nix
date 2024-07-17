{userSettings, ...}: {
  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    git = {
      enable = true;
      userName = userSettings.gitUser;
      userEmail = userSettings.gitEmail;
      extraConfig = {
        init.defaultBranch = "main";
      };
      ignores = [
        ".DS_Store"
        ".env"
        ".env.local"
      ];
    };
    lazygit = {enable = true;};
  };
}
