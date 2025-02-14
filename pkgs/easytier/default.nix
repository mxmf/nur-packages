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
  version = "2.2.2";

  nativeBuildInputs = [
    protobuf
    clang
  ];
  LIBCLANG_PATH = "${libclang.lib}/lib";

  src = fetchFromGitHub {
    owner = "EasyTier";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-Heb2ax2yUuGmqzIjrqjHUL3QZoofp7ATrIEN27ZA/Zs=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-U2ZK9GlfTjXsA7Fjd288YDlqSZNl3vHryLG1FE/GH5c=";

  doCheck = false;

  meta = with lib; {
    description = "A simple, safe and decentralized VPN networking solution implemented with the Rust language and Tokio framework.";
    homepage = "https://www.easytier.top";
    license = licenses.asl20;
    maintainers = with maintainers; [ mxmf ];
    platforms = platforms.linux;
  };
}
