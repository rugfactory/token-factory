# Creating Tokens with rtkn

## Storage Deposit

Before creating a token, you need to deposit storage fees. Use these commands:

For testnet:
```bash
near call rtkn.testnet storage_deposit '{}' --use-account rugfactory.testnet --deposit 10
```

For mainnet:
```bash
near call rtkn.near storage_deposit '{}' --use-account rugfactory.near --deposit 10
```

## Testnet Token Creation

To create a new token on testnet, use this command:

```bash
near call rtkn.testnet create_token '{
  "args": {
    "metadata": {
      "icon": "data:image/png;base64,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",
      "name": "FIRST",
      "symbol": "FIRST",
      "decimals": 18,
      "spec": "ft-1.0.0"
    },
    "total_supply": "1000000000000000000000000000",
    "owner_id": "rugfactory.testnet"
  }
}' --accountId rugfactory.testnet --gas 300000000000000
```

## Mainnet Token Creation

To create a new token on mainnet, use this command:

```bash
near all rtkn.testnet create_token '{
  "args": {
    "metadata": {
      "icon": "data:image/png;base64,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",
      "name": "FIRST",
      "symbol": "FIRST",
      "decimals": 18,
      "spec": "ft-1.0.0"
    },
    "total_supply": "1000000000000000000000000000",
    "owner_id": "rugfactory.testnet"
  }
}' --accountId rugfactory.near --gas 300000000000000
```

## Important Notes

1. Replace `rugfactory` with your actual NEAR account name
2. The `total_supply` is set to 1 billion tokens (1,000,000,000). With 18 decimals, this becomes 1000000000000000000000000000 (1 billion * 10^18)
3. Customize the token `name` and `symbol` according to your requirements
4. The `decimals` value can be modified (default is 18)
5. Make sure you have enough NEAR balance for deployment fees
6. Storage deposit (1 NEAR) is required before creating any tokens