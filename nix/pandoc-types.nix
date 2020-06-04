{ mkDerivation, aeson, base, bytestring, containers, criterion
, deepseq, fetchgit, ghc-prim, HUnit, QuickCheck, stdenv, string-qq
, syb, test-framework, test-framework-hunit
, test-framework-quickcheck2, text, transformers
}:
mkDerivation {
  pname = "pandoc-types";
  version = "1.21";
  src = fetchgit {
    url = "https://github.com/jgm/pandoc-types";
    sha256 = "0hdbkrlcys2sh4nvzgw4lbhjvqlfrllhi8j8d3fv6cicmilh5br9";
    rev = "dd50a6eaeaf63773bbf04d6ef34b86d6f92b7825";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    aeson base bytestring containers deepseq ghc-prim QuickCheck syb
    text transformers
  ];
  testHaskellDepends = [
    aeson base bytestring containers HUnit QuickCheck string-qq syb
    test-framework test-framework-hunit test-framework-quickcheck2 text
  ];
  benchmarkHaskellDepends = [ base criterion text ];
  homepage = "https://pandoc.org/";
  description = "Types for representing a structured document";
  license = stdenv.lib.licenses.bsd3;
}
