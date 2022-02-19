# Azure Cosmos DB Emulator Github Action

This GitHub Action starts the Azure Cosmos DB Emulator [that is already installed on GitHub Actions Virtual Environments for Windows](https://github.com/actions/virtual-environments/tree/main/images/win). As the Emulator is only installed on Windows Virtual Environments, it only works there.

## Example usage

```
jobs:
  emulator:
    runs-on: windows-latest
    steps:
      - uses: janpio/cosmos-emulator-github-action@main
      - name: 'npm ci'
        run: npm ci
      - name: 'npm test'
        run: npm test
```
