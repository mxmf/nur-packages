{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kd";
  version = "0.0.13";

  src = fetchFromGitHub {
    owner = "Karmenzind";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-y1X3bCBPm3315FTvDLu+mFToT2CpSe69SeCxtsYV+w0=";
  };

  vendorHash = "sha256-PE721BujRsTz50TbHXXk5IyxPZ8W6RPKaEwJtCbAYkY=";

  doCheck = false;


  postInstall = ''

  mv $out/bin/cmd $out/bin/kd

  '';


  meta = with lib; {
    description = "a crystal clear command-line dictionary, written in Go";
    homepage = "https://github.com/Karmenzind/kd";
    license = licenses.mit;
    maintainers = with maintainers;[ mxmf ];
  };
}

