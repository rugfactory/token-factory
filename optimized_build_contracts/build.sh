#!/bin/bash
set -e

pushd token
./build.sh
wasm-opt token/res/fungible_token.wasm -O4 -o token/res/fungible_token.wasm
popd

pushd factory
./build.sh
popd




