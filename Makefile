
derivation.nix: Cargo.lock
	carnix Cargo.lock --src . --output derivation.nix

