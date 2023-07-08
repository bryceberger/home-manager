{
  description = "Home Manager configuration of bryce";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-std.url = "github:chessai/nix-std";

    helix-typst.url = "github:AlexanderBrevig/helix/feat/add-typst";
  };

  outputs = { nixpkgs, nix-std, home-manager, hyprland, helix-typst, ... }:
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
        extraSpecialArgs = { inherit nix-std hyprland helix-typst; };
      };
    };
}
