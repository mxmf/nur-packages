# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlays` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  example-package = pkgs.callPackage ./pkgs/example-package { };
  easytier = pkgs.callPackage ./pkgs/easytier { };
  trzsz-ssh = pkgs.callPackage ./pkgs/trzsz-ssh { };
  trzsz-go = pkgs.callPackage ./pkgs/trzsz-go { };
  kd = pkgs.callPackage ./pkgs/kd { };
  touying = pkgs.python3Packages.callPackage ./pkgs/touying { };
  fake-bpy-module-4-2 = pkgs.python3Packages.callPackage ./pkgs/fake-bpy-module/fake-bpy-module-4-2.nix { };
  vesta = pkgs.callPackage ./pkgs/vesta { };

  # some-qt5-package = pkgs.libsForQt5.callPackage ./pkgs/some-qt5-package { };
  # ...
}
