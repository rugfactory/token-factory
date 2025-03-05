#!/bin/bash
set -e

pushd token
./build.sh
# Apply additional wasm optimization with conservative settings
wasm-opt res/fungible_token.wasm -O2 -o res/fungible_token.wasm
popd

pushd factory
./build.sh
popd




