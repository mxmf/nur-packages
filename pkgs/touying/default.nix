{ lib
, setuptools
, fetchPypi
, maturin
, pipInstallHook
, rustPlatform
, python-pptx
, pillow
, jinja2
, python3

, buildPythonPackage
}:

let
  typst-py = rustPlatform.buildRustPackage rec{
    pname = "typst";
    version = "0.11.1";

    src = fetchPypi {
      inherit pname version;
      hash = "sha256-VqM2/vHb7GrmeNh9aAqQrQfIc5vAWZtU/df6NRpO+lY=";
    };

    nativeBuildInputs = [ maturin pipInstallHook ];

    propagatedBuildInputs = [ python3 ];

    doCheck = false;

    cargoLock =
      {
        lockFile = ./Cargo.lock;
      };

    # In order to make typst-lsp build with rust >= 1.80,  use the patched Cargo.lock and Cargo.toml
    postPatch = ''
      rm Cargo.lock Cargo.toml
      ln -s ${./Cargo.lock} Cargo.lock
      ln -s ${./Cargo.toml} Cargo.toml
    '';

    buildPhase = ''
      maturin build --release --manylinux off
    '';

    installPhase = ''
      # Put the wheels where the pip install hook can find them.
      install -Dm644 -t dist target/wheels/*.whl
      pipInstallPhase
    '';

    meta = with lib;{
      description = "Python binding to typst, a new markup-based typesetting system that is powerful and easy to learn.";
      homepage = "https://pypi.org/project/typst/";
      license = licenses.asl20;
      maintainers = with maintainers; [ mxmf ];
    };
  };
in
buildPythonPackage rec{
  pname = "touying";
  version = "0.11.3";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ShHB6rJiTDJDzFRL32o1OfwCw+XnA9+1vuo7vbNvZWM=";
  };

  propagatedBuildInputs = [
    # ...
    setuptools
  ];
  # pyproject = true;
  format = "pyproject";

  # format = "setuptools";

  prePatch = ''
    sed -i '/argparse/d' pyproject.toml
  '';

  dependencies = [
    python-pptx
    pillow
    jinja2
    typst-py
  ];

  meta = with lib;{
    description = "Export presentation slides in various formats for Touying.";
    homepage = "https://github.com/touying-typ/touying-exporter";
    license = licenses.mit;
    maintainers = with maintainers; [ mxmf ];
  };
}

