{ lib
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {


  pname = "EasyTier";
  version = "2.1.1";



  nativeBuildInputs = [ protobuf ];
  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-qWICiY2g/wXT0Bt7lrCg7GgL1futOhelViB59UCLPro=";
  };

  useFetchCargoVendor = true;

  cargoHash = "sha256-SpGW/RAbQUFdxqEKRPrTp5MXng7BLiSnofoJG8NsjsU=";


  # cargoLock = {
  #   lockFile = ./Cargo.lock;
  #   outputHashes = {
  #     "service-manager-0.7.1" = "sha256-UetvoPlK+teFfulQonNJ+VQbcL5ur627o0W6VwDM/kA=";
  #   };

  # };

  doCheck = false;

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
