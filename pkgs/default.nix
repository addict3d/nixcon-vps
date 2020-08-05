{ pkgs ? import <nixpkgs> { } ,
  poetry ? pkgs.poetry }:

rec {

  poetry2nix = import (pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "poetry2nix";
    rev = "270a0b26b773e566ad59927c51d40a5e9b8ff08d";
    sha256 = "0yw8vdwgqw2y3mpyya9gy1l93115yxnv5yamr31nfvzhwkgj9qz5";
  }) { inherit pkgs poetry; };

  #pretix = import ./pretix {
    #inherit pkgs poetry2nix;
  #};

  pretalx = import ./pretalx {
    inherit pkgs poetry2nix;
  };

}
