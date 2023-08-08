{ stdenvNoCC, lib, fetchFromGitHub }: stdenvNoCC.mkDerivation {
  name = "mpv-visualizer";

  src = fetchFromGitHub {
    owner = "mfcc64";
    repo = "mpv-scripts";
    rev = "f9c6c520c40d3f4b25e5792e49a6d87930257faf";
    sha256 = "K3YFsNNf0LK6PJVGNjNn3RM5vMCnQhJgpG+CzBi1YKY=";
  };

  buildPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp visualizer.lua  $out/share/mpv/scripts
  '';

  passthru.scriptName = "visualizer.lua";

  meta = with lib; {
    description = "MPV audio visualizer";
    homepage = "https://github.com/mfcc64/mpv-scripts";
    platforms = platforms.all;
    maintainers = with maintainers; [ bartkk ];
    license = licenses.unlicense;
  };
}
