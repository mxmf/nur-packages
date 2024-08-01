{ lib
, fuse
, buildGoModule
, fetchFromGitHub
, fetchurl
, go
, installShellFiles
, stdenv
}:

buildGoModule rec {
  pname = "alist";
  version = "3.36.0";

  src = fetchFromGitHub {
    owner = "alist-org";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-l0/DS7ZSuto8QHvSf1ae7wy/a7yqp05koWpb+ExvJJk=";
  };

  CGO_ENABLED = 1;
  vendorHash = "sha256-uBZ32aoCjAk14DmTtPSbtfyf7RffFOzvpcF+Ptrkq1A=";
  buildInputs = [ fuse ];
  web = fetchurl {
    url = "https://github.com/alist-org/alist-web/releases/download/${version}/dist.tar.gz";
    hash = "sha256-uZfT7PkvRHzB2sqbGum53D8oRFWJ2z3AVBdOzBWmAKk=";
  };

  ldflags = [
    "-w"
    "-s"
    "-X github.com/alist-org/alist/v3/internal/conf.BuiltAt=Nix"
    "-X github.com/alist-org/alist/v3/internal/conf.GoVersion=${go.version}"
    "-X 'github.com/alist-org/alist/v3/internal/conf.GitAuthor=Xhofe <i@nn.ci>'"
    "-X github.com/alist-org/alist/v3/internal/conf.GitCommit=${version}"
    "-X github.com/alist-org/alist/v3/internal/conf.Version=${version}"
    "-X github.com/alist-org/alist/v3/internal/conf.WebVersion=${version}"
  ];

  preConfigure = ''
    # build sandbox do not provide network
    rm pkg/aria2/rpc/client_test.go pkg/aria2/rpc/call_test.go

    # use matched web files
    rm -rf public/dist
    cp ${web} dist.tar.gz
    tar -xzf dist.tar.gz
    mv -f dist public
  '';

  nativeBuildInputs = [ installShellFiles ];
  postInstall = lib.optionalString (stdenv.buildPlatform.canExecute stdenv.hostPlatform) ''
    installShellCompletion --cmd alist \
      --bash <($out/bin/alist completion bash) \
      --fish <($out/bin/alist completion fish) \
      --zsh <($out/bin/alist completion zsh)
  '';

  meta = with lib; {
    description = "
    A
    file list/WebDAV
    program
    that
    supports
    multiple
    storages, powered by Gin and Solidjs.";
    homepage = "https://alist.nn.ci/";
    license = licenses.agpl3Only;
    maintainers = with maintainers;[ mxmf ];
  };
}



