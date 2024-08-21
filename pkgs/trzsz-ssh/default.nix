{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "trzsz-ssh";
  version = "0.1.22";

  src = fetchFromGitHub {
    owner = "trzsz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-VvPdWRP+lrhho+Bk5rT9pktEvKe01512WoDfAu5d868=";
  };

  vendorHash = "sha256-EllXxDyWI4Dy5E6KnzYFxuYDQcdk9+01v5svpARZU44=";

  doCheck = false;

  meta = with lib; {
    description = "An ssh client designed as a drop-in replacement for the openssh client.";
    homepage = "https://trzsz.github.io/ssh";
    license = licenses.mit;
    maintainers = with maintainers;[ mxmf ];
  };
}

