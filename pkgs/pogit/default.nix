{ stdenv, lib, writeText, fetchFromGitHub, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "pogit";
  version = "git";

  src = fetchFromGitHub {
	owner = "y-syo";
	repo = "pogit";
	rev = "f3d4498d5a5a45b31455c193e3391f9bed82bd45";
	hash = "sha256-b8uqV0/e9SAbG7w+jerIv6S1vZOJYvHXu+iU9wTgDnc=";
  };
}
