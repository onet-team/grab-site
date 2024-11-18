## ref, i guess: https://raw.githubusercontent.com/NixOS/nixpkgs/70bdadeb94ffc8806c0570eb5c2695ad29f0e421/pkgs/tools/backup/grab-site/default.nix
{
  description = "grab-site using pinned 22.11";
  # because it worked the other day (a year ago)

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }: let
    # FIXME: ie darwin
    system = "x86_64-linux";
  in {
    # flake-utils.lib.eachSystem ["x86_64-linux"]
    # (
    #   system: let
    #     pkgs = import nixpkgs {
    #       inherit system;
    #       overlays = [
    #         self.overlays.default
    #       ];
    #     };
    #   in {
    #     devShells = {
    #       #run by `nix devlop` or `nix-shell`(legacy)
    #       default = import ./shell.nix {inherit pkgs;};
    #     };
    #   }
    # )
    # // {
    #   overlays.default = selfPkgs.overlay;
    packages.x86_64linux = {
      default = grab-site.default;

      modules = [
        #~ (nixos-rk3588 + "/modules/boards/orangepi5.nix")
        ./grab-site
      ];
    };
    # )
    # };
  };
}
