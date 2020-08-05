{
  pkgs ? import <nixpkgs> { },
  poetry2nix ? (import ../. { inherit pkgs; }).poetry2nix
}:

let
  django-scopes = pkgs.python38Packages.callPackage ./django-scopes.nix { };
  app = poetry2nix.mkPoetryApplication {
    projectDir = ./.;
    doCheck = false;

    overrides = poetry2nix.overrides.withDefaults (
      self: super: {
        inherit django-scopes;
      }
    );
  };
in app
