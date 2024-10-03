{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "EasyTier";
  version = "2.0.0";



  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Qej6g9oxY6Wvv7jbyK9TN7QE7sfrdref7XPj10mSKUg=";
  };

  cargoHash = "sha256-607VgaNRlcAkmvaah4dwW23GKbClIinhj1SNPV6WRF8=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
