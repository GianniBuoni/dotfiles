# related hardware modules for an asus laptop
let
  formFactor = "asusLaptop";
in {
  flake.aspects = {aspects, ...}: {
    ${formFactor} = {
      includes = with aspects; [
        asusd
        nvidia
        nvidia._.${formFactor}
      ];
      nixos = {};
    };
  };
}
