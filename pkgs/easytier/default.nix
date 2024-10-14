{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "EasyTier";
  version = "2.0.3";



  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-0bS2VzddRZcFGmHugR0yXHjHqz06tpL4+IhQ6ReaU4Y=";
  };

  cargoHash = "sha256-TEARMO8/OK2GuXpkIkb7S05azYsV0/+ibnOq5BGRcOU=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
