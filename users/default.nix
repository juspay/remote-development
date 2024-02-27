{ lib, ... }:

let
  # TODO: compute this using builtins.readDir?
  # Or just use the module system.
  users = {
    srid = import ./srid.nix;
    shivaraj = import ./shivaraj.nix;
  };
in
users
