{ stdenv, lib, writeText, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pogit";
  version = "git";

  src = fetchFromGitHub {
	owner = "y-syo";
	repo = "pogit";
	rev = "b17bdd667cf003fe312892fa6a2cb2b47239c8de";
	hash = "sha256-MPKVxFxeCmGziK2sYPs8lVVUfCIGOUg/UAR3sCUrIAM=";
  };
}
