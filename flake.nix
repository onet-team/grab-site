{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.11";
    #~ nixos-generators = {
      #~ url = "github:nix-community/nixos-generators";
      #~ inputs.nixpkgs.follows = "nixpkgs";
    #~ };
  };
  outputs = {
    self,
    nixpkgs,
    #~ nixos-generators,
    ...
  }: let
    system = "x86_64-linux";
  in {
    # the installation media is also the installation target,
    # so we don't want to provide the installation configuration.nix.
    packages = {
      x86_64linux = { # system??
        #~ cyclop-orange_pi_5_plus = nixos-generators.nixosGenerate {
          #~ system = "aarch64-linux";
          #~ meta = {
            #~ # using the same nixpkgs as nixos-rk3588 to utilize the cross-compilation cache.
            #~ nixpkgs = import nixos-rk3588.inputs.nixpkgs {inherit system;};
            #~ specialArgs = nixos-rk3588.inputs;
          #~ };

default = grab-site.default;

           modules = [
            #~ # import the rk3588 module, which contains the configuration for bootloader/kernel/firmware
            #~ (nixos-rk3588 + "/modules/boards/orangepi5.nix")
            #~ Systems/Base
            #~ Systems/cyclop.nix
./grab-site
           ];
        #~ };
	
	# https://raw.githubusercontent.com/NixOS/nixpkgs/70bdadeb94ffc8806c0570eb5c2695ad29f0e421/pkgs/tools/backup/grab-site/default.nix
      };
    };
  };
}
# parts and forEachSystem