{
  description = "My NixOS configuration with Talosctl";

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          {
            environment.systemPackages = with pkgs; [
              (pkgs.callPackage ./talos.nix { })
            ];
          }
        ];
      };
    };
}
