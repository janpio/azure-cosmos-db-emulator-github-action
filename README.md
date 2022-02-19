# Azure Cosmos DB Emulator Github Action

This GitHub Action starts the [Azure Cosmos DB Emulator](https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator?tabs=ssl-netstd21) that is already [installed on GitHub Actions Virtual Environments for Windows](https://github.com/actions/virtual-environments/tree/main/images/win). As the Emulator is only available on Windows Virtual Environments, it only works on the `windows-*` images.

Additionally the Action also [patches](patch/psm1.patch) the [included PowerShell module](https://docs.microsoft.com/en-us/azure/cosmos-db/emulator-command-line-parameters) to be able to use more of the available [command-line parameters](https://docs.microsoft.com/en-us/azure/cosmos-db/emulator-command-line-parameters#command-line) (attention: The documentation of both the command-line and PowerShell module are very outdated and do not reflect reality) - concretely I need to be able to specify the MongoDB version for `-EnableMongoDb` via `-EnableMongoDb 4.0`.

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
