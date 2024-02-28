{ lib, ... }:

let
  # TODO: compute this using builtins.readDir?
  # Or just use the module system.
  users = {
    srid = import ./srid.nix;
    shivaraj = import ./shivaraj.nix;

    "aditya.garg" = import ./aditya.garg.nix;
    "rohit.singh" = import ./rohit.singh.nix;
  };
in
users
