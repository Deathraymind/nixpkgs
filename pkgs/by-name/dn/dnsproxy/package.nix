{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "dnsproxy";
  version = "0.75.2";

  src = fetchFromGitHub {
    owner = "AdguardTeam";
    repo = "dnsproxy";
    rev = "v${version}";
    hash = "sha256-lxrb6DIYompvLX3R7HI63C7ZbNW76J28Xnt7AHTVwmQ=";
  };

  vendorHash = "sha256-PIj91tN9LbNaBE5gLTYD7p9dgcRaFe1i7PnWNJ5H580=";

  ldflags = [
    "-s"
    "-w"
    "-X"
    "github.com/AdguardTeam/dnsproxy/internal/version.version=${version}"
  ];

  # Development tool dependencies; not part of the main project
  excludedPackages = [ "internal/tools" ];

  doCheck = false;

  meta = with lib; {
    description = "Simple DNS proxy with DoH, DoT, and DNSCrypt support";
    homepage = "https://github.com/AdguardTeam/dnsproxy";
    license = licenses.asl20;
    maintainers = with maintainers; [
      contrun
      diogotcorreia
    ];
    mainProgram = "dnsproxy";
  };
}
