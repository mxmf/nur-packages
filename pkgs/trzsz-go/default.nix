{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "trzsz-go";
  version = "1.1.7";

  src = fetchFromGitHub {
    owner = "trzsz";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-E9mp41bhBoRZCXFkLNn/ZV1XZeDf0KzbXOhVxt0bFF4=";
  };

  vendorHash = "sha256-XSVN2Qv3DXiAVZGxyCJoQoFKAPQMHp6j8f+MYfbOw/w=";

  doCheck = false;

  meta = with lib; {
    description = "trzsz-go makes all terminals that support local shell to support trzsz ( trz / tsz ), which similar to ( rz / sz ), and compatible with tmux.";
    homepage = "https://trzsz.github.io/go";
    license = licenses.mit;
    maintainers = with maintainers;[ mxmf ];
  };
}

