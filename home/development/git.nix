{userSettings, ...}: {
  programs.git = {
    enable = true;
    userName = userSettings.gitUser;
    userEmail = userSettings.gitEmail;
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "oauth";
    };
    ignores = [
      ".DS_Store"
      ".env"
      ".env.local"
    ];
  };
}
