#!/bin/bash
set -e

pushd token
./build.sh
wasm-opt res/fungible_token.wasm -O4 -o res/fungible_token.wasm
popd

pushd factory
./build.sh
wasm-opt res/token_factory.wasm -O4 -o res/token_factory.wasm
popd




