{ lib, ... }:

let
  # TODO: compute this using builtins.readDir
  users = {
    srid = import ./srid.nix;
    shivaraj = import ./shivaraj.nix;
  };
in
users
