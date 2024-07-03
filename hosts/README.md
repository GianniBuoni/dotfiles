## Hosts Folder Setup

The `/hosts` folder should be setup like this:

```
├── default.nix
├── ${userSettings.hostName}        # Name it after the variable set in .env.local.nix
│   ├── default.nix
│   └── hardware-configuration.nix
```

`default.nix` is simply an import list of modules.
