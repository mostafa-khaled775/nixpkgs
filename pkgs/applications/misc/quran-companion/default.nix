{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  wrapQtAppsHook,
  qtbase,
  qtsvg,
  qtmultimedia,
  qttools,
  qtimageformats,
  qttranslations,
}:
stdenv.mkDerivation rec {
  pname = "quran-companion";
  version = "1.3.2";

  src = fetchFromGitHub {
    owner = "0xzer0x";
    repo = "${pname}";
    tag = "v${version}";
    hash = "sha256-7d2KmGgujrC/aGJ0Szqw9zctlRIULoOMOkwp/FJi95A=";
    fetchSubmodules = true;
  };

  strictDeps = true;

  buildInputs = [
    qtbase
    qtsvg
    qtmultimedia
    qttools
    qtimageformats
    qttranslations
  ];

  nativeBuildInputs = [
    wrapQtAppsHook
    cmake
  ];

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

  meta = {
    description = "Free and open-source desktop Quran reader and player 💻";
    longDescription = ''
      Quran Companion is a cross-platform Quran reader/player with
      recitation download capabilities, verse highlighting,
      resizable quran font, and a variety of tafsir books &
      translations
    '';
    homepage = "https://0xzer0x.github.io/projects/quran-companion/";
    license = lib.licenses.free;
    mainProgram = "quran-companion";
    maintainers = with lib.maintainers; [ MostafaKhaled ];
    platforms = lib.platforms.all;
  };
}
