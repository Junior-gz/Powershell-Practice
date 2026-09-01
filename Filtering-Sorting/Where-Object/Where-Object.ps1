# Filter process using more than 100MB of memory
Get-Process | Where-Object { $_.WorkingSet -gt 100MB }

# Filter services that are currently running
Get-Service | Where-Object { $_.Status -eq "Runnning" }

# Simplified syntax (Powershell 3.0+) - no scrit block needed for simple comparisons
Get-Process | Where-Object WorkingSet -gt 100MB

# Combine multiple conditions
Get-Process | Where-Object { $_.WorkingSet -gt 100MB -and $_.CPU -gt 10 }
