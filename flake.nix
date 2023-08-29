{
  description = "A very basic flake";
  # ls /dev/disk/by-id/
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; #https://github.com/NixOS/nixos-hardware
    disko.url = "github:nix-community/disko?ref=00169fe4a6015a88c3799f0bf89689e06a4d4896";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  with inputs; 
  let
    system = "x86_64-linux";
    specialArgs = { inherit inputs self; };
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
        "milk-machine" = nixpkgs.lib.nixosSystem {
            inherit specialArgs system;
            modules = [
              disko.nixosModules.disko
              home-manager.nixosModules.home-manager
              nixos-hardware.nixosModules.lenovo-thinkpad-t480 #https://github.com/NixOS/nixos-hardware/blob/master/lenovo/thinkpad/t480/default.nix
              ./system/milk-machine
            ];
        };
    };
    
    homeConfigurations ={
        "lactose@milk-machine" = home-manager.lib.homeManagerConfiguration  {
          inherit pkgs;
          extraSpecialArgs = specialArgs;
          modules = [
            ./home-manager/lactose
          ];
        };
    };
    
    packages.${system} = {
        disko = disko.packages.${system}.disko;
    };

    devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          just
          alejandra
        ];

        shellHook = ''
        '';
    };

    nixConfig = {
      extra-trusted-public-keys = [];
      builders-use-substitutes = true;
      extra-substituters = [];
    };
  };
}
