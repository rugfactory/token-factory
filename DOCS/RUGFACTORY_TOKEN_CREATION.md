# Creating Tokens with rtkn

## Storage Deposit

Before creating a token, you need to deposit storage fees. Use these commands:

For testnet:
```bash
near call rtkn.testnet storage_deposit '{}' --accountId YOUR_ACCOUNT.testnet --deposit 10
```

For mainnet:
```bash
near call rtkn.near storage_deposit '{}' --accountId YOUR_ACCOUNT.near --deposit 10
```

## Testnet Token Creation

To create a new token on testnet, use this command:

```bash
near call rtkn.testnet create_token '{
  "args": {
    "metadata": {
      "icon": null,
      "name": "Example Token",
      "symbol": "EXMPL",
      "decimals": 18,
      "spec": "ft-1.0.0"
    },
    "total_supply": "1000000000000000000000000000",
    "owner_id": "YOUR_ACCOUNT.testnet"
  }
}' --accountId YOUR_ACCOUNT.testnet --gas 300000000000000
```

## Mainnet Token Creation

To create a new token on mainnet, use this command:

```bash
near call rtkn.near create_token '{
  "args": {
    "metadata": {
      "icon": null,
      "name": "Example Token",
      "symbol": "EXMPL",
      "decimals": 18,
      "spec": "ft-1.0.0"
    },
    "total_supply": "1000000000000000000000000000",
    "owner_id": "YOUR_ACCOUNT.near"
  }
}' --accountId YOUR_ACCOUNT.near --gas 300000000000000
```

## Important Notes

1. Replace `YOUR_ACCOUNT` with your actual NEAR account name
2. The `total_supply` is set to 1 billion tokens (1,000,000,000). With 18 decimals, this becomes 1000000000000000000000000000 (1 billion * 10^18)
3. Customize the token `name` and `symbol` according to your requirements
4. The `decimals` value can be modified (default is 18)
5. Make sure you have enough NEAR balance for deployment fees
6. Storage deposit (10 NEAR) is required before creating any tokens
7. You can withdraw your storage deposit when you no longer need it