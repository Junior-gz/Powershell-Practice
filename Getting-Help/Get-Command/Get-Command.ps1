*Anything in the starts is an example

# List every command available in your current session
Get-Command

# Find commands by verb (great for discovery)
Get-Command -Verb Get

# Find commands by noun (e.g. everything related to "Service")
Get-Command -Noun Service

# Finds commands from a specific module
Get-Command -module *Microsoft.Powershell.Management*

# Combine verb + noun to find the exact cmdlet
Get-Command -Verb Get -Noun Process
