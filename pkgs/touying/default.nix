{ lib
, setuptools
, fetchPypi
, python-pptx
, python3Packages
, pillow
, jinja2
, buildPythonPackage
}:

buildPythonPackage rec{
  pname = "touying";
  version = "0.12.1";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-sCoUzZLVsydTfonJhsbOKy3Ntk022x6X8INHlJamJjQ=";
  };

  propagatedBuildInputs = [
    setuptools
  ];

  format = "pyproject";

  prePatch = ''
    sed -i '/argparse/d' pyproject.toml
  '';

  dependencies = [
    python-pptx
    pillow
    jinja2
    python3Packages.typst
  ];

  meta = with lib;{
    description = "Export presentation slides in various formats for Touying.";
    homepage = "https://github.com/touying-typ/touying-exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ mxmf ];
  };
}

