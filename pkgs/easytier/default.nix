{ lib
, rustPlatform
, fetchCrate
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "easytier";
  version = "1.1.0";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-kR9SlK5MDQhtQ+b9VZYXFdZ25DfsD45MOrk9NiyTAYE=";
  };

  cargoHash = "sha256-LlJuvcNhj6/rRnl44B5Apix5FaJO7uzxHvsLBUgkJcA=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
