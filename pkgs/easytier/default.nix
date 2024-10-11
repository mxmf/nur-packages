{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;
  env.PROTOC = lib.getExe' protobuf "protoc";

  pname = "EasyTier";
  version = "2.0.2";



  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-pmX0vb87cTS0poo91FVP7qj+ZVSArqLb2JcdFFZ1B7g=";
  };

  cargoHash = "sha256-ZvUR6+5HL3Xg2qJnt0ytZwJOT/LOxBy/4PVYgN0ri0c=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
