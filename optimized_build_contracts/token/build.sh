#!/bin/bash
set -e

RUSTFLAGS='-C opt-level=z -C codegen-units=1 -C panic=abort -C link-arg=-s' cargo build --target wasm32-unknown-unknown --release
cp target/wasm32-unknown-unknown/release/fungible_token.wasm ./res/
