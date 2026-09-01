# Filter process using more than 100MB of memory
Get-Process | Where-Object { $_.WorkingSet -gt 100MB }

# Filter services that are currently running
Get-Service | Where-Object { $_.Status -eq "Runnning" }
