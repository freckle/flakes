{ mkDerivation, aeson, ansi-terminal, array, base, binary, bytestring
, Cabal-syntax, choice, containers, deepseq, Diff, directory, file-embed
, filepath, ghc-lib-parser, hspec, hspec-discover, hspec-megaparsec, lib
, megaparsec, MemoTrie, mtl, optparse-applicative, path, path-io, pretty
, process, QuickCheck, scientific, syb, temporary, terminal-size, text, th-env
, yaml }:
mkDerivation {
  pname = "fourmolu";
  version = "0.16.2.0";
  sha256 = "bd87b1a181d54608ed00fc7737d91d57b5897049b00a243a6b4b3d7c25fd78ed";
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson
    ansi-terminal
    array
    base
    binary
    bytestring
    Cabal-syntax
    choice
    containers
    deepseq
    Diff
    directory
    file-embed
    filepath
    ghc-lib-parser
    megaparsec
    MemoTrie
    mtl
    scientific
    syb
    text
  ];
  executableHaskellDepends = [
    base
    Cabal-syntax
    containers
    directory
    filepath
    ghc-lib-parser
    optparse-applicative
    terminal-size
    text
    th-env
    yaml
  ];
  testHaskellDepends = [
    base
    bytestring
    Cabal-syntax
    choice
    containers
    Diff
    directory
    filepath
    ghc-lib-parser
    hspec
    hspec-megaparsec
    megaparsec
    path
    path-io
    pretty
    process
    QuickCheck
    temporary
    text
    yaml
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/fourmolu/fourmolu";
  description = "A formatter for Haskell source code";
  license = lib.licenses.bsd3;
  mainProgram = "fourmolu";
}
