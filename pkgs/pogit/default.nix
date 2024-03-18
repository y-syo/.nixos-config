{ stdenv, lib, writeText, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pogit";
  version = "git";

  src = fetchFromGitHub {
	owner = "y-syo";
	repo = "pogit";
	rev = "4ea8d7d26195de39bdee31158cd2de2879d2f2bf";
	hash = "sha256-jrK8IWooV7+Hic32G6BgCtxoEqlXPe7vP1cH/HTijjo=";
  };
}
