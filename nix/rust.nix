{ nixpkgs
, channel ? "nightly"
, date ? "2021-08-24"
, sha256 ? "30dHH53OlZt6h2OJxeVJ8IokaQrSaV7aGfhUiv2HU0Q="
, targets ? [ "wasm32-unknown-unknown" "wasm32-wasi" ]
}:
let
  rust = (nixpkgs.rustChannelOf {
    inherit channel date sha256;
  }).rust.override {
    inherit targets;
    extensions = [ "rust-src" "rust-analysis" ];
  };
in
rust
