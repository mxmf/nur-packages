{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "EasyTier";
  version = "2.0.1";



  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Adhilx6eTgnpZeCujmGdkELQFsnpiDqhpdKEna3MVgk=";
  };

  cargoHash = "sha256-hYdrn/6ftvkWLWCYw0B+TYSuYaHxeFSB3X3lMdYasGk=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
