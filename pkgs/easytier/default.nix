{ lib
, rustPlatform
, fetchCrate
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "easytier";
  version = "1.2.2";

  src = fetchCrate {
    inherit pname version;
    hash = "sha256-D4Eu8uoFCNmnJ4LgQ8UXcb4YlapafmDzPs2drCD6VaM=";
  };

  cargoHash = "sha256-1s7tfhQGV1XjbGECXGWFVfl9qW+yUnP2TbZYNerLUrA=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
