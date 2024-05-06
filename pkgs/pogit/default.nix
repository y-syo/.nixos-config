{ stdenv, lib, writeText, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pogit";
  version = "git";

  src = fetchFromGitHub {
	owner = "y-syo";
	repo = "pogit";
	rev = "1367f7d10d93bb6853e89c806e78ae5ff114b49b";
	hash = "sha256-FEmjZBRBHMx5SCL5qSKddClQGPOACMrSjxw7qRKK/3o=";
  };
}
