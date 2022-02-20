# Azure Cosmos DB Emulator Github Action

This GitHub Action starts the [Azure Cosmos DB Emulator](https://docs.microsoft.com/en-us/azure/cosmos-db/local-emulator?tabs=ssl-netstd21) that is by default already [installed on GitHub Actions Windows Virtual Environments](https://github.com/actions/virtual-environments/tree/main/images/win). You can supply the [parameters](https://docs.microsoft.com/en-us/azure/cosmos-db/emulator-command-line-parameters#manage-the-emulator-with-powershell) used to start it via `Start-CosmosDbEmulator` with `parameters_string` (Careful: The documentation of _both_ the [command-line and PowerShell module](https://docs.microsoft.com/en-us/azure/cosmos-db/emulator-command-line-parameters) are pretty outdated, check their actual help output!). 

⚠️ The action only works on `windows-*` images, and not on Linux or MacOS. ⚠️

Additionally the action also [patches](patch/psm1.patch) the PowerShell module of the emulator to be able to specify the MongoDB API version via `-EnableMongoDb 4.0` (vs. the default `false|true` that just let's you turn on the MongoDB 3.2 API).

## Example usage

### Default
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

### Azure Cosmos DB API for MongoDB

```
jobs:
  emulator-with-mongodb:
    runs-on: windows-latest
    steps:
      - uses: janpio/cosmos-emulator-github-action@main
        with:
          parameter_string: "-EnableMongoDb 4.0"
      - name: 'npm ci'
        run: npm ci
      - name: 'npm test'
        run: npm test
```

