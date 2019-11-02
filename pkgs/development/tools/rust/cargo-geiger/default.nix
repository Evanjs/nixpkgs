{ stdenv, lib, fetchFromGitHub
, rustPlatform, pkgconfig
, openssl, Security }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-geiger";
  version = "0.7.3";

  src = fetchFromGitHub {
    owner = "anderejd";
    repo = pname;
    rev = "${pname}-${version}";
    sha256 = "1lm8dx19svdpg99zbpfcm1272n18y63sq756hf6k99zi51av17xc";
  };

  doCheck = false;

  cargoSha256 = "16zvm2y0j7ywv6fx0piq99g8q1sayf3qipd6adrwyqyg8rbf4cw6";

  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ Security ];
  nativeBuildInputs = [ pkgconfig ];

  meta = with lib; {
    description = "Detects usage of unsafe Rust in a Rust crate and its dependencies.";
    homepage = https://github.com/anderejd/cargo-geiger;
    license = with licenses; [ asl20 /* or */ mit ];
    maintainers = with maintainers; [ evanjs ];
    platforms = platforms.all;
  };
}
