let
  # Pin nixpkgs
  hostPkgs = import <nixpkgs> {
    config.networking.enableIPv6 = false;
  };
  pinnedPkgs = hostPkgs.fetchgit (hostPkgs.lib.filterAttrs (n: v: n != "date") (hostPkgs.lib.importJSON ./nixpkgs.json));
in pinnedPkgs
