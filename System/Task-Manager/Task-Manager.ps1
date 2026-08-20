*Anything in the stars is an example

# Filters process tab by filters on top
Get-Process | Sort-Object *CPU* -Descending | Select-Object -First 10