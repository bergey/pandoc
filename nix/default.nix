let
    nixpkgs =
        let snapshot = builtins.fromJSON (builtins.readFile ./nixpkgs-snapshot.json);
        inherit (snapshot) owner repo rev;
        in builtins.fetchTarball {
            inherit (snapshot) sha256;
            url = "https://github.com/${owner}/${repo}/archive/${rev}.tar.gz";
            };
    pkgs = import nixpkgs {
      overlays = [(self: super: {
        haskellPackages = super.haskellPackages.override {
          overrides = (newH: oldH: rec {
            doclayout = newH.callHackage "doclayout" "0.3" {};
            doctemplates = newH.callHackage "doctemplates" "0.8.2" {};
            hslua = newH.callHackage "hslua" "1.1.0" {};
            jira-wiki-markup = newH.callHackage "jira-wiki-markup" "1.3.0" {};
            pandoc-types = newH.callPackage ./pandoc-types.nix {};
          });
        };
      })];
    };
in
  pkgs.haskellPackages.callPackage ./pandoc.nix { }
