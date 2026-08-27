# Basic usage - shows help for cmdlet
Get-Help Get-Process

# Show full help icluding examples
Get-Help Get-process -Full

# Shows ONLY the example section (Most useful day to day)
Get-Help Get-Help -Examples

# Search for cmdlets related to a keyword
Get-Help *service*

# Update the local help files (run as admin, needed the first time)
Update-Help
