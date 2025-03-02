#!/bin/bash
set -e

RUSTFLAGS='-C opt-level=z -C codegen-units=1 -C panic=abort -C link-arg=-s' cargo build --target wasm32-unknown-unknown --release
cp target/wasm32-unknown-unknown/release/token_factory.wasm ./res/
wasm-opt ./res/token_factory.wasm -Oz -o ./res/token_factory.wasm
wasm-strip ./res/token_factory.wasm

