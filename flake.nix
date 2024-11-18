# https://raw.githubusercontent.com/NixOS/nixpkgs/70bdadeb94ffc8806c0570eb5c2695ad29f0e421/pkgs/tools/backup/grab-site/default.nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    # nixpkgs.url = "nixos/nixpkgs/70bdadeb94ffc8806c0570eb5c2695ad29f0e421";
  };
  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    system = "x86_64-linux";
  in {
    packages = {
      x86_64-linux = {
        default = grab-site.default;

        modules = [
          ./grab-site
        ];
      };
    };
  };
}
