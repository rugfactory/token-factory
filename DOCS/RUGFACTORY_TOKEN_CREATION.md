# Creating Tokens with Rugfactory

## Testnet Token Creation

To create a new token on testnet, use this command:

```bash
near call rugfactory.testnet create_token '{"owner_id": "YOUR_ACCOUNT.testnet", "total_supply": "1000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Example Token", "symbol": "EXMPL", "icon": null, "reference": null, "reference_hash": null, "decimals": 18 }}' --accountId YOUR_ACCOUNT.testnet
```

## Mainnet Token Creation

To create a new token on mainnet, use this command:

```bash
near call rugfactory.near create_token '{"owner_id": "YOUR_ACCOUNT.near", "total_supply": "1000000000000000", "metadata": { "spec": "ft-1.0.0", "name": "Example Token", "symbol": "EXMPL", "icon": null, "reference": null, "reference_hash": null, "decimals": 18 }}' --accountId YOUR_ACCOUNT.near
```

## Important Notes

1. Replace `YOUR_ACCOUNT` with your actual NEAR account name
2. Adjust the `total_supply` value as needed
3. Customize the token `name` and `symbol` according to your requirements
4. The `decimals` value can be modified (default is 18)
5. Make sure you have enough NEAR balance for deployment fees