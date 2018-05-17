let
  env = import ./env.nix;
in
  { pkgs ? env.pkgs, rustc ? env.rustc, buildRustPackage ? env.buildRustPackage, cargo ? env.cargo }:

pkgs.stdenv.mkDerivation {
    name = "carnix-ring-issue-demo-shell";
    buildInputs = [ pkgs.openssl ];
    nativeBuildInputs = [ pkgs.pkgconfig rustc cargo pkgs.carnix ];
    shellHook =
        ''
          export OPENSSL_INCLUDE_DIR=${pkgs.openssl.dev}
          export OPENSSL_LIB_DIR=$(pkg-config --libs-only-L openssl | cut -c3-)
        '';
}
