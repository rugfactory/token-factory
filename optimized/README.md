# WebAssembly Optimization and Conversion Guide

> This was an experiment at size optimization. The optimized token factory still outputs the regular token size,

## Installation Instructions

### Install WebAssembly Binary Toolkit (wabt)

For macOS (using Homebrew):
```bash
brew install wabt
```

For Ubuntu/Debian:
```bash
sudo apt-get install wabt
```

For other Linux distributions, build from source:
```bash
git clone --recursive https://github.com/WebAssembly/wabt
cd wabt
mkdir build
cd build
cmake ..
make
```

### Install wasm-opt (Binaryen)

For macOS (using Homebrew):
```bash
brew install binaryen
```

For Ubuntu/Debian:
```bash
sudo apt-get install binaryen
```

For other Linux distributions, build from source:
```bash
git clone https://github.com/WebAssembly/binaryen.git
cd binaryen
cmake . && make
```

## Contract Optimization

### Create Optimization Directory

First, create a directory for optimized files:
```bash
mkdir -p optimized
```

### Optimize Factory Contract

```bash
wasm-opt contracts/factory/res/token_factory.wasm -O4 -o optimized/token_factory.wasm
```

### Optimize Token Contract

```bash
wasm-opt contracts/token/res/fungible_token.wasm -O4 -o optimized/token.wasm
```

Optimization flags:
- `-O4`: Maximum optimization level
- `-Os`: Optimize for size
- `-Oz`: Optimize aggressively for size

## WASM/WAT Conversion

### Convert WASM to WAT

For Factory Contract:
```bash
wasm2wat contracts/factory/res/token_factory.wasm -o optimized/token_factory.wat
```

For Token Contract:
```bash
wasm2wat contracts/token/res/fungible_token.wasm -o optimized/token.wat
```

### Convert WAT back to WASM

For Factory Contract:
```bash
wat2wasm optimized/token_factory.wat -o optimized/token_factory_converted.wasm
```

For Token Contract:
```bash
wat2wasm optimized/token.wat -o optimized/token_converted.wasm
```

## Verification

To verify the size reduction after optimization:
```bash
# Check original size
ls -lh contracts/factory/res/token_factory.wasm

# Check optimized size
ls -lh optimized/token_factory.wasm
```

## Important Notes

1. Always backup your original WASM files before optimization
2. Test the optimized contracts thoroughly before deployment
3. The WAT format is useful for inspection and debugging
4. Different optimization levels (-O1 to -O4) offer different trade-offs between size and speed
5. The optimized folder will contain all processed files
6. Relative paths in the commands assume you're in the project root directory