*Anything in between the stars are examples


# List Environment variables
Get-ChildItem Env:

# Creates a session variable
$env:*PSP* = "*C:\Users\G2mus\Powershell-Practice*"

# Creates a permanent variable
[Enviroment]::SetEnviromentVariable("*PSP*", "*C:\Users\G2mus\Powershell-Practice*", "User")