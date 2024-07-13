{userSettings, ...}: {
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  programs.git = {
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
}
