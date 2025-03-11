{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    haskell-flake.url = "github:srid/haskell-flake";
    strongweak.url   = "github:raehik/strongweak";
    strongweak.flake = false;
    binrep.url   = "github:raehik/binrep";
    binrep.flake = false;
  };

  outputs = inputs:
  let
    defDevShell = compiler: {
      mkShellArgs.name = "${compiler}";
      hoogle = false;
      tools = _: {
        haskell-language-server = null;
        hlint = null;
        ghcid = null;
      };
    };
  in

    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports = [ inputs.haskell-flake.flakeModule ];
      perSystem = { self', pkgs, config, ... }: {
        packages.default  = self'.packages.ghc98-binrep-instances;
        devShells.default = self'.devShells.ghc98;
        haskellProjects.ghc910 = {
          basePackages = pkgs.haskell.packages.ghc910;
          devShell = defDevShell "ghc910";

          packages.binrep.source = inputs.binrep;

          packages.finite-typelits.source = "0.2.1.0";
          packages.vector-sized.source = "1.6.1";

          # https://github.com/phadej/defun/pull/5
          settings.defun-core.jailbreak = true;

          # waiting on nixpkgs update
          settings.strongweak.broken = false;
          packages.strongweak.source = inputs.strongweak;
        };

        haskellProjects.ghc98 = {
          basePackages = pkgs.haskell.packages.ghc98;
          devShell = defDevShell "ghc98";

          packages.binrep.source = inputs.binrep;

          # waiting on nixpkgs update
          settings.strongweak.broken = false;
          packages.strongweak.source = inputs.strongweak;
        };

        haskellProjects.ghc96 = {
          basePackages = pkgs.haskell.packages.ghc96;
          devShell = defDevShell "ghc96";

          packages.binrep.source = inputs.binrep;

          # waiting on nixpkgs update
          settings.strongweak.broken = false;
          packages.strongweak.source = inputs.strongweak;
        };
      };
    };
}
