{
  description = "A flake providing Docker and Docker Compose";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05"; 

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.docker
        pkgs.docker-compose
      ];
    };
  };
}