# Show curret directory
Get-Location

# List contents of current directory
Get-ChildItem

# Change directory
Set-Location C:\

# Test whether a that exist
Test-Path C:\Lab

# Show hidden items also in directory
Get-ChildItem -Force

# Remembers where you are, them moves you somewhere else
Push-Location

# Takes you back where it last remembered
Pop-Location

# Checks if a path exist
Test-Path