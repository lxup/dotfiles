{
  description = "Nix flake for loup's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      pkgsMacSilicon = nixpkgs.legacyPackages."aarch64-darwin";
      pkgsMacIntel   = nixpkgs.legacyPackages."x86_64-darwin";
      pkgsLinux      = nixpkgs.legacyPackages."x86_64-linux";
    in {
      homeConfigurations = {
        "loup@mac" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsMacSilicon;
          extraSpecialArgs = { username = "loup"; homeDirectory = "/Users/loup"; };
          modules = [ ./home.nix ];
        };
        "loup@mac-intel" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsMacIntel;
          extraSpecialArgs = { username = "loup"; homeDirectory = "/Users/loup"; };
          modules = [ ./home.nix ];
        };
        "loup@linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsLinux;
          extraSpecialArgs = { username = "loup"; homeDirectory = "/home/loup"; };
          modules = [ ./home.nix ];
        };
      };
    };
}