Write-Host "Launching Azure Cosmos DB Emulator (parameters = $args)"
Import-Module "$env:ProgramFiles\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator"
Start-CosmosDbEmulator $args