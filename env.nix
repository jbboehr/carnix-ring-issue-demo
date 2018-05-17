rec {
  pkgs = import (import ./nixpkgs.nix) {
    config.nix.overlays = [ (import ./nixpkgs-mozilla/rust-overlay.nix) ];
  };
  rustChannel = pkgs.rustChannelOf { date = "2018-05-15"; channel = "nightly"; };
  rustc = rustChannel.rust;
  cargo = rustChannel.cargo;
  buildRustPackage = pkgs.callPackage <nixpkgs/pkgs/build-support/rust> {
    rust = {
        inherit rustc cargo;
    };
  };
  buildRustCrate = pkgs.callPackage <nixpkgs/pkgs/build-support/rust/build-rust-crate.nix> {
     inherit rustc;
  };
}

