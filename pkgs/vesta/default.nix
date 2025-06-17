{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, wrapGAppsHook
, makeWrapper
, glib
, gtk2
, xorg
, libGLU
, gtk3
, webkitgtk_4_0
, jdk
}:

stdenv.mkDerivation rec
{
  # edit from  https://github.com/CHN-beta/nixos/blob/2f4034a3f8c7d11b9deafe922c253fb47e2b7aea/packages/vesta.nix#L6
  pname = "vesta";
  version = "3.90.5a";
  src = fetchurl
    {
      url = "https://jp-minerals.org/vesta/archives/testing/VESTA-gtk3-x86_64.tar.bz2";
      sha256 = "sha256-WvO+Rc0Z1LYBudPhkNOf2M9m8BPgEkIIOYR7tFGaM6Y=";
    };
  desktopFile = fetchurl
    {
      url = "https://aur.archlinux.org/cgit/aur.git/plain/VESTA.desktop?h=vesta&id=4fae08afc37ee0fd88d14328cf0d6b308fea04d1";
      sha256 = "sha256-Tq4AzQgde2KIWKA1k6JlxvdphGG9JluHMZjVw0fBUeQ=";
    };

  nativeBuildInputs =
    [ autoPatchelfHook wrapGAppsHook makeWrapper glib gtk2 xorg.libXxf86vm libGLU gtk3 xorg.libXtst webkitgtk_4_0 jdk ];

  unpackPhase = "tar -xf ${src}";

  installPhase =
    ''
      echo $out
      mkdir -p $out/share/applications
      cp ${desktopFile} $out/share/applications/vesta.desktop
      sed -i "s|Exec=.*|Exec=$out/bin/vesta|" $out/share/applications/vesta.desktop
      sed -i "s|Icon=.*|Icon=$out/opt/VESTA-gtk3/img/logo.png|" $out/share/applications/vesta.desktop

      mkdir -p $out/opt
      cp -r VESTA-gtk3-x86_64 $out/opt/VESTA-gtk3-x86_64

      mkdir -p $out/bin
      makeWrapper $out/opt/VESTA-gtk3-x86_64/VESTA $out/bin/vesta

      patchelf --remove-needed libjawt.so $out/opt/VESTA-gtk3-x86_64/PowderPlot/libswt-awt-gtk-3346.so
    
      ln -s ${src} $out/src
    '';

  meta = with lib; {
    description = "A 3D visualization program for structural models, volumetric data such as electron/nuclear densities, and crystal morphologies.";
    homepage = "https://jp-minerals.org/vesta/en/";
    maintainers = with maintainers;[ mxmf ];
  };

}
