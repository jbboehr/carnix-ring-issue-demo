let
  env = import ./env.nix;
in
  { pkgs ? env.pkgs, rust ? env.rust, buildRustPackage ? env.buildRustPackage, cargo ? env.cargo }:

pkgs.callPackage ./derivation.nix {
  inherit (env) buildRustCrate;
}

