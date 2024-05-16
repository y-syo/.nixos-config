{ stdenv, lib, writeText, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pogit";
  version = "git";

  src = fetchFromGitHub {
	owner = "y-syo";
	repo = "pogit";
	rev = "d357e7ca02c29ffa3218488162faa380df656c6b";
	hash = "sha256-siq54/2zEDjnHzVjJ9N4k+rCixJAyGXPbjqA+tDYP9Y=";
  };
}
