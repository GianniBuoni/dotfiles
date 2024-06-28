{userSettings, ...}: {
  programs.gh.gitCredentialHelper.enable = true;
  programs.git = {
    enable = true;
    userName = userSettings.gitUser;
    userEmail = userSettings.gitEmail;
    extraConfig = {
      init.defaultBranch = "main";
      credential = {
        "https://github.com".helper = "!gh auth git-credential";
        "https://gist.github.com".helper = "!gh auth git-credential";
      };
    };
    ignores = [
      ".DS_Store"
      ".env"
      ".env.local"
    ];
  };
}
