#!/usr/bin/env bash
# Run this ONCE, with internet access, from the same folder as index.html.
# It downloads three.js + its addons + the DRACO decoder + the HDR environment
# presets into ./vendor/. After that, index.html works completely offline —
# open it straight from disk, no server or connection needed.
set -e
BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
V="0.165.0"
DRACO_V="1.5.6"

mkdir -p "$BASE/vendor/three/build"
mkdir -p "$BASE/vendor/three/examples/jsm/controls"
mkdir -p "$BASE/vendor/three/examples/jsm/loaders"
mkdir -p "$BASE/vendor/three/examples/jsm/libs"
mkdir -p "$BASE/vendor/draco"
mkdir -p "$BASE/vendor/hdr"

get(){ echo "  → $2"; curl -fsSL "$1" -o "$2"; }

echo "Fetching three.js core + addons ($V)..."
get "https://cdn.jsdelivr.net/npm/three@$V/build/three.module.min.js" "$BASE/vendor/three/build/three.module.min.js"
get "https://cdn.jsdelivr.net/npm/three@$V/examples/jsm/controls/OrbitControls.js" "$BASE/vendor/three/examples/jsm/controls/OrbitControls.js"
get "https://cdn.jsdelivr.net/npm/three@$V/examples/jsm/loaders/GLTFLoader.js" "$BASE/vendor/three/examples/jsm/loaders/GLTFLoader.js"
get "https://cdn.jsdelivr.net/npm/three@$V/examples/jsm/loaders/DRACOLoader.js" "$BASE/vendor/three/examples/jsm/loaders/DRACOLoader.js"
get "https://cdn.jsdelivr.net/npm/three@$V/examples/jsm/loaders/RGBELoader.js" "$BASE/vendor/three/examples/jsm/loaders/RGBELoader.js"
get "https://cdn.jsdelivr.net/npm/three@$V/examples/jsm/libs/meshopt_decoder.module.js" "$BASE/vendor/three/examples/jsm/libs/meshopt_decoder.module.js"

echo "Fetching DRACO decoder ($DRACO_V) — only needed for Draco-compressed .glb files..."
get "https://www.gstatic.com/draco/versioned/decoders/$DRACO_V/draco_decoder.js" "$BASE/vendor/draco/draco_decoder.js"
get "https://www.gstatic.com/draco/versioned/decoders/$DRACO_V/draco_decoder.wasm" "$BASE/vendor/draco/draco_decoder.wasm"
get "https://www.gstatic.com/draco/versioned/decoders/$DRACO_V/draco_wasm_wrapper.js" "$BASE/vendor/draco/draco_wasm_wrapper.js"

echo "Fetching HDR environment presets (Studio / Sunset / Night)..."
get "https://threejs.org/examples/textures/equirectangular/quarry_01_1k.hdr" "$BASE/vendor/hdr/quarry_01_1k.hdr"
get "https://threejs.org/examples/textures/equirectangular/venice_sunset_1k.hdr" "$BASE/vendor/hdr/venice_sunset_1k.hdr"
get "https://threejs.org/examples/textures/equirectangular/moonless_golf_1k.hdr" "$BASE/vendor/hdr/moonless_golf_1k.hdr"

echo ""
echo "Done. index.html now works fully offline — just open it in a browser."
