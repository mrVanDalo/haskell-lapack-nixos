# main wireing in here.
{ nixpkgs ? import <nixpkgs> {} }:
let
  blas-ffi = nixpkgs.pkgs.haskellPackages.callPackage ./blas-ffi.nix { blas = nixpkgs.pkgs.openblas; };
  non-empty = nixpkgs.pkgs.haskellPackages.callPackage ./non-empty.nix {};
  comfort-array = nixpkgs.pkgs.haskellPackages.callPackage ./comfort-array.nix { inherit non-empty; };
  fixed-length = nixpkgs.pkgs.haskellPackages.callPackage ./fixed-length.nix { inherit non-empty; };
  lapack = nixpkgs.pkgs.haskellPackages.callPackage ./lapack.nix { inherit blas-ffi comfort-array non-empty fixed-length; };
in
  lapack
