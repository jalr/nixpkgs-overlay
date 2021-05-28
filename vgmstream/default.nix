{ lib, stdenv, fetchFromGitHub, cmake, pkg-config, fdk_aac, ffmpeg, jansson, libao, libvorbis, mpg123 }:

stdenv.mkDerivation rec {
  pname = "vgmstream";
  version = "r1050-3448-g77cc431b";

  src = fetchFromGitHub {
    owner = "vgmstream";
    repo = "vgmstream";
    rev = version;
    sha256 = "030q02c9li14by7vm00gn6v3m4dxxmfwiy9iyz3xsgzq1i7pqc1d";
  };

  nativeBuildInputs = [ cmake pkg-config ];
  buildInputs = [ fdk_aac ffmpeg jansson libao libvorbis mpg123 ];

  cmakeFlags = [
    "-DBUILD_AUDACIOUS=OFF"
    "-DVGMSTREAM_VERSION=${version}"
  ];

  meta = with lib; {
    description = "A library for playback of various streamed audio formats used in video games";
    homepage = "https://vgmstream.org/";
    license = with licenses; [ mit ];
    maintainers = with maintainers; [ sbruder ];
    platforms = platforms.all;
  };
}
