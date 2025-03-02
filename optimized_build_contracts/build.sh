#!/bin/bash
set -e

pushd token
./build.sh
wasm-opt res/fungible_token.wasm -Oz -o res/fungible_token.wasm
wasm-strip res/fungible_token.wasm
popd

pushd factory
./build.sh
wasm-opt res/token_factory.wasm -Oz -o res/token_factory.wasm
wasm-strip res/token_factory.wasm
popd




