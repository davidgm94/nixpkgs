{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "mods";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "charmbracelet";
    repo = "mods";
    rev = "v${version}";
    hash = "sha256-r7j7iMkfkFsohguu2vkhyxUbaMwJQURfUJrnC6yUCFI=";
  };

  vendorHash = "sha256-+0yGFCGd/9bIBjXYp8UPGqKum2di5O1ALMyDSxcVujg=";

  ldflags = [ "-s" "-w" "-X=main.version=${version}" ];

  meta = with lib; {
    description = "AI on the command line";
    homepage = "https://github.com/charmbracelet/mods";
    license = licenses.mit;
    maintainers = with maintainers; [ dit7ya ];
  };
}
