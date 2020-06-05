    {
      packages = {
        "texmath" = (((hackage.texmath)."0.12.0.2").revisions).default;
        "haddock-library" = (((hackage.haddock-library)."1.9.0").revisions).default;
        "skylighting" = (((hackage.skylighting)."0.8.4").revisions).default;
        "skylighting-core" = (((hackage.skylighting-core)."0.8.4").revisions).default;
        "regex-pcre-builtin" = (((hackage.regex-pcre-builtin)."0.95.1.2.8.43").revisions).default;
        "regex-base" = (((hackage.regex-base)."0.94.0.0").revisions).default;
        "doclayout" = (((hackage.doclayout)."0.3").revisions).default;
        "emojis" = (((hackage.emojis)."0.1").revisions).default;
        "hslua" = (((hackage.hslua)."1.1.0").revisions).default;
        "jira-wiki-markup" = (((hackage.jira-wiki-markup)."1.3.0").revisions).default;
        "HsYAML" = (((hackage.HsYAML)."0.2.1.0").revisions).default;
        "HsYAML-aeson" = (((hackage.HsYAML-aeson)."0.2.0.0").revisions).default;
        "doctemplates" = (((hackage.doctemplates)."0.8.2").revisions).default;
        pandoc = ./pandoc.nix;
        pandoc-types = ./pandoc-types.nix;
        pandoc-citeproc = ./pandoc-citeproc.nix;
        };
      };
  resolver = "lts-14.6";
  modules = [
    ({ lib, ... }:
      {
        packages = {
          "pandoc" = {
            flags = {
              "trypandoc" = lib.mkOverride 900 false;
              "static" = lib.mkOverride 900 false;
              "embed_data_files" = lib.mkOverride 900 true;
              };
            };
          "pandoc-citeproc" = {
            flags = {
              "bibutils" = lib.mkOverride 900 true;
              "embed_data_files" = lib.mkOverride 900 true;
              "debug" = lib.mkOverride 900 false;
              "unicode_collation" = lib.mkOverride 900 false;
              "test_citeproc" = lib.mkOverride 900 false;
              };
            };
          };
        })
    {
      packages = {
        "$locals" = {
          package = {
            ghcOptions = "-fhide-source-paths -Wno-missing-home-modules";
            };
          };
        };
      }
    ];
  }
