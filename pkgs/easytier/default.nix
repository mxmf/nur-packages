{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {

  doCheck = false;

  pname = "EasyTier";
  version = "2.1.0";



  nativeBuildInputs = [ protobuf ];
  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-kPKCsKsTNT0vuESquILQJxBltP5MJ6/wKrPGx2g1Z78=";
  };


  useFetchCargoVendor = true;
  cargoHash = "sha256-/avdvHl7rfATGxHS5F1drK/J4pT+srX0+qRzA3cniAk=";

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
