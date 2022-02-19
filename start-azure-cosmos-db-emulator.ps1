Import-Module "$env:ProgramFiles\Azure Cosmos DB Emulator\PSModules\Microsoft.Azure.CosmosDB.Emulator"

# Shut down potentially already running emulator
Write-Host "Shutting down potentially already running emulators"
Stop-CosmosDbEmulator
Write-Host "Done."

# Start emulator with supplied parameters
# https://stackoverflow.com/a/51544284
Write-Host "Launching Azure Cosmos DB Emulator (parameters = $args)"
$params = "$($args -join " ")"
Invoke-Expression "Start-CosmosDbEmulator $params"
Write-Host "Done."