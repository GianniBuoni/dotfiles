{
  flake-file.inputs.sb.url = "github:GianniBuoni/second-brain";

  flake.aspects.flakePackages = {
    description = "Set of programs imported from flake inputs";
    nixos = {
      inputs,
      lib,
      config,
      ...
    }: let
      mkPkg = pname: inputs.${pname}.packages.${config.hostData.system}.default;
      inputs' = ["sb"];
    in {
      environment.systemPackages = lib.map mkPkg inputs';
    };
  };
}
