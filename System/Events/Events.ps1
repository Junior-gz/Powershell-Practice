*Anything that is in the stars is an example

# Gets the 20 most recent system log entries
Get-WinEvent -LogName *System* -MaxEvents 20

# Filters log to only errors
Get-WinEvent -LogName *System* | Where-Object {$_.LevelDisplayName -eq "Error"}

# Filters event to a specific event ID
Get-WinEvent -FilterHashtable @{LogName='System'; Id=7036}