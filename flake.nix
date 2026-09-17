{
  description = "Dendritic NixOS Config - Inspiron3501";    #Change name depending of host machine's.

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = inputs@{ flake-parts, nixpkgs, home-manager, disko, impermanence, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      # Architectures supported by the config.
      systems = [ "x86_64-linux" ];

      # Flake configuration.
      flake = {
        # Make sure to check   vvvvv   the host name.
        nixosConfigurations.Inspiron3501 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # External modules.
            disko.nixosModules.disko
            impermanence.nixosModules.impermanence

            # Main config location.
            # Make sure to check the host folder being used.
            ./hosts/laptop/configuration.nix

            # Home Manager integration.
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              # Make sure to check vvv the username.
              home-manager.users.rriver06 = import ./home/default.nix;
            }
          ];
        };
      };
    };

}
