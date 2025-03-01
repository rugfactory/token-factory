# RTKN Token Factory Deployment Guide

This guide focuses on deploying the pre-built Token Factory contract to rtkn.testnet and rtkn.near addresses.

## Testnet Deployment

1. Login to your NEAR testnet account:
   ```bash
   near login
   ```

2. Deploy the contract:
   ```bash
   near deploy --accountId rtkn.testnet --wasmFile res/token_factory.wasm
   ```

3. Initialize the contract:
   ```bash
   near call rtkn.testnet new '{}' --accountId rtkn.testnet
   ```

## Mainnet Deployment

1. Login to your NEAR mainnet account:
   ```bash
   export NEAR_ENV=mainnet
   near login
   ```

2. Deploy the contract:
   ```bash
   near deploy --accountId rtkn.near --wasmFile res/token_factory.wasm
   ```

3. Initialize the contract:
   ```bash
   near call rtkn.near new '{}' --accountId rtkn.near
   ```

## Storage Management

Deposit storage fees before creating tokens:

For testnet:
```bash
near call rtkn.testnet storage_deposit '' --accountId YOUR_ACCOUNT.testnet --amount 1
```

For mainnet:
```bash
near call rtkn.near storage_deposit '' --accountId YOUR_ACCOUNT.near --amount 1
```

## Creating a Token

For testnet:
```bash
NEAR_ARGS='{"owner_id": "YOUR_ACCOUNT.testnet", "total_supply": "1000000000000000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Example Token", "symbol": "EXMPL", "icon": null, "reference": null, "reference_hash": null, "decimals": 18 }}'

near call rtkn.testnet create_token "$NEAR_ARGS" --accountId YOUR_ACCOUNT.testnet
```

For mainnet:
```bash
NEAR_ARGS='{"owner_id": "YOUR_ACCOUNT.near", "total_supply": "1000000000000000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Example Token", "symbol": "EXMPL", "icon": null, "reference": null, "reference_hash": null, "decimals": 18 }}'

near call rtkn.near create_token "$NEAR_ARGS" --accountId YOUR_ACCOUNT.near
```

## Viewing Deployed Tokens

For testnet:
```bash
# Get number of tokens
near view rtkn.testnet get_number_of_tokens

# View token details
near view rtkn.testnet get_tokens '{"from_index": 0, "limit": 10}'

# View specific token
near view rtkn.testnet get_token '{"token_id": "exmpl"}'
```

For mainnet:
```bash
# Get number of tokens
near view rtkn.near get_number_of_tokens

# View token details
near view rtkn.near get_tokens '{"from_index": 0, "limit": 10}'

# View specific token
near view rtkn.near get_token '{"token_id": "exmpl"}'
```

## Important Notes

1. Ensure you have the pre-built `token_factory.wasm` file in the `res/` directory
2. Replace `YOUR_ACCOUNT` with your actual NEAR account name
3. Token symbols must be lowercase alphanumeric characters only
4. Each token will be deployed as a sub-account of rtkn (e.g., `exmpl.rtkn.testnet` or `exmpl.rtkn.near`)
5. Make sure to have enough NEAR balance for storage and deployment fees
6. The total_supply is set to 1 billion tokens (1,000,000,000). With 18 decimals, this becomes 1000000000000000000000000000 (1 billion * 10^18)