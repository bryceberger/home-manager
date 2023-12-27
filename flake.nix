{
  inputs = {
    nixpkgs.url = "nixpkgs";
    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-std.url = "github:chessai/nix-std";
    flake-utils.url = "github:numtide/flake-utils";

    nix-index-database = {
      url = "github:Mic92/nix-index-database";
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
    nix-index-database,
    helix,
    power-graphing,
    calc,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    username = "bryce";
    extraModules = {inherit nix-std system helix power-graphing calc;};

    nix-index = [
      nix-index-database.hmModules.nix-index
      {programs.nix-index-database.comma.enable = true;}
    ];
  in {
    formatter.${system} = pkgs.alejandra;

    homeConfigurations."${username}@luna" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = extraModules // {hostname = "luna";};
      modules = [./luna.nix] ++ nix-index;
    };

    homeConfigurations."${username}@janus" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = extraModules // {hostname = "janus";};
      modules = [./janus.nix] ++ nix-index;
    };
  };
}
