## Users Folder Setup

The `/users` folder should be set up like this:

```
├── default.nix
├── home
│   └── ${userSettings.userName}.nix    # Name this after the variable set in .env.local.nix
```

`${userSettings.userName}.nix` is simply an import list of modules.
