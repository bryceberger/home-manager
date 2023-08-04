{
  description = "Home Manager configuration of bryce";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nix-std.url = "github:chessai/nix-std";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix-typst = {
      url = "github:AlexanderBrevig/helix/feat/add-typst";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs
    , nix-std
    , home-manager
    , hyprland
    , helix-typst
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;

      homeConfigurations."bryce" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          hyprland.homeManagerModules.default
          ./janus.nix
        ];
        extraSpecialArgs = {
          inherit
            nix-std system
            hyprland helix-typst
            ;
        };
      };
    };
}
