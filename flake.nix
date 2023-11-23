{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-std.url = "github:chessai/nix-std";

    # for pinning transitive deps
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:helix-editor/helix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };

    power-graphing = {
      url = "path:/home/bryce/rust/power";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };
    calc = {
      url = "path:/home/bryce/todo-riir/unit-calculator";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = {
    nixpkgs,
    nix-std,
    home-manager,
    helix,
    power-graphing,
    calc,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations."bryce" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./luna.nix
      ];
      extraSpecialArgs = {
        inherit
          nix-std
          system
          helix
          power-graphing
          calc
          ;
      };
    };
  };
}
