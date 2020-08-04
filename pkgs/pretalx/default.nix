{
  pkgs ? import <nixpkgs> { },
  poetry2nix ? (import ../. { inherit pkgs; }).poetry2nix
}:

let
  django-scopes = pkgs.python3Packages.callPackage ./django-scopes.nix { };
  app = mypoetry2nix.mkPoetryApplication {
    projectDir = ./.;
    doCheck = false;

    overrides = mypoetry2nix.overrides.withDefaults (
      self: super: {
        inherit django-scopes;
      }
    );
  };
in app.dependencyEnv
