{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "trzsz-ssh";
  version = "0.1.21";

  src = fetchFromGitHub {
    owner = "trzsz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kQtVhu7ILUEFeIby89hXrLIfGqVRB5UiFwdXDqsLUYU=";
  };

  vendorHash = "sha256-6NPrzQoy+5leXEray9djy2NmxYp1on24U9deBHcl3tU=";

  doCheck = false;

  meta = with lib; {
    description = "An ssh client designed as a drop-in replacement for the openssh client.";
    homepage = "https://trzsz.github.io/ssh";
    license = licenses.mit;
    maintainers = with maintainers;[ mxmf ];
  };
}

