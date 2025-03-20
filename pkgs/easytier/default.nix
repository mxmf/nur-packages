{ lib
, clang
, libclang
, llvmPackages
, rustPlatform
, fetchFromGitHub
, protobuf
}:

rustPlatform.buildRustPackage rec {


  pname = "EasyTier";
  version = "2.2.4";

  nativeBuildInputs = [
    protobuf
    clang
  ];
  LIBCLANG_PATH = "${libclang.lib}/lib";

  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-YrWuNHpNDs1VVz6Sahi2ViPT4kcJf10UUMRWEs4Y0xc=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-uUmF4uIhSx+byG+c4hlUuuy+O87Saw8wRJ5OGk3zaPA=";

  doCheck = false;

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
