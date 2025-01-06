{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, wheel
, pkgs
}:

buildPythonPackage rec {
  pname = "fake-bpy-module-4.2";
  version = "20241010";
  pyproject = true;

  src = fetchPypi {
    pname = "fake_bpy_module_4_2";
    inherit version;
    sha256 = "1e782018ecdfd0ecf78b1a1e91e25ac3359bcb338d7ea154072a07a3e87890a6";
    # extension = "zip";
  };

  nativeBuildInputs = [
    setuptools
    wheel

  ];

  pythonImportsCheck = [ "bpy" ];

  meta = with lib; {
    description = "Collection of the fake Blender Python API module for the code completion";
    homepage = "https://pypi.org/project/fake-bpy-module-latest";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
  };
}
