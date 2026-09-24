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

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = inputs@{ flake-parts, nixpkgs, home-manager, disko, impermanence, sops-nix, nix-flatpak, ... }:
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
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak

            # Main config location.
            # Make sure to check the host folder being used.
            ./hosts/laptop/configuration.nix

            # Home Manager integration.
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                # Make sure to check the username here.
                users.rriver06 = import ./home/laptop.nix;
                backupFileExtension = "backup";
              };
            }
          ];
        };
      };
    };

}
