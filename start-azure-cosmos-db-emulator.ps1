Write-Host "Launching Azure Cosmos DB Emulator (parameters = $args)"
Import-Module "$env:ProgramFiles\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator"
# Shut down potentially already running emulator
Stop-CosmosDbEmulator
# Start emulator with supplied parameters
# https://stackoverflow.com/a/51544284
$params = "$($args -join " ")"
Invoke-Expression "Start-CosmosDbEmulator $params"
Write-Host "Done."