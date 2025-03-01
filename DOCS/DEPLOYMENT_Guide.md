# Token Factory Contract Deployment Guide

This guide will walk you through the process of deploying the Token Factory contract on NEAR Protocol.

## Prerequisites

1. [NEAR CLI](https://docs.near.org/tools/near-cli#setup) installed
2. [Rust](https://rustup.rs/) with `wasm32-unknown-unknown` target installed
3. A NEAR account (testnet or mainnet)

## Build Process

1. Navigate to the factory contract directory:
   ```bash
   cd contracts/factory
   ```

2. Build the contract:
   ```bash
   ./build.sh
   ```
   This will create a WebAssembly file at `res/token_factory.wasm`

## Account Setup

### For Testnet

1. Login to your NEAR testnet account:
   ```bash
   near login
   ```

2. Create a sub-account for the factory (optional):
   ```bash
   near create-account factory.youraccount.testnet --masterAccount youraccount.testnet --initialBalance 5
   ```

### For Mainnet

1. Login to your NEAR mainnet account:
   ```bash
   export NEAR_ENV=mainnet
   near login
   ```

2. Create a sub-account for the factory (optional):
   ```bash
   near create-account factory.youraccount.near --masterAccount youraccount.near --initialBalance 5
   ```

## Deployment

1. Deploy the contract:

   For testnet:
   ```bash
   near deploy --accountId factory.youraccount.testnet --wasmFile res/token_factory.wasm
   ```

   For mainnet:
   ```bash
   near deploy --accountId factory.youraccount.near --wasmFile res/token_factory.wasm
   ```

2. Initialize the contract:
   ```bash
   near call factory.youraccount.testnet new '{}' --accountId factory.youraccount.testnet
   ```

## Storage Management

Before creating tokens, you need to deposit storage fees:

```bash
   near call factory.youraccount.testnet storage_deposit '' --accountId youraccount.testnet --amount 1
```

## Creating a Token

To create a new fungible token:

```bash
NEAR_ARGS='{"owner_id": "youraccount.testnet", "total_supply": "1000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Example Token", "symbol": "EXMPL", "icon": null, "reference": null, "reference_hash": null, "decimals": 18 }}'

near call factory.youraccount.testnet create_token "$NEAR_ARGS" --accountId youraccount.testnet
```

## Viewing Deployed Tokens

1. Get the number of tokens:
   ```bash
   near view factory.youraccount.testnet get_number_of_tokens
   ```

2. View token details:
   ```bash
   near view factory.youraccount.testnet get_tokens '{"from_index": 0, "limit": 10}'
   ```

3. View specific token:
   ```bash
   near view factory.youraccount.testnet get_token '{"token_id": "exmpl"}'
   ```

## Important Notes

1. The factory contract requires storage deposits for creating tokens.
2. Token symbols must be lowercase alphanumeric characters only.
3. Each token will be deployed as a sub-account of the factory (e.g., `exmpl.factory.youraccount.testnet`).
4. Make sure to have enough NEAR balance for storage and deployment fees.
5. The token metadata must follow the NEP-141 standard.

## Security Considerations

1. Always verify the contract initialization parameters before deployment.
2. Ensure proper access control for token creation.
3. Keep your account credentials secure.
4. Test thoroughly on testnet before deploying to mainnet.

## Troubleshooting

1. If token creation fails, check:
   - Storage deposit balance
   - Token symbol validity
   - Account permissions
   - NEAR balance for fees

2. For deployment issues:
   - Verify the WASM file exists
   - Check account permissions
   - Ensure correct network environment (testnet/mainnet)