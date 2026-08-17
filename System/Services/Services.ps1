*Anything in the stars in an example

# List all of the services
Get-Service

# Shows the start up type of a service
Get-Service -Name "Spooler" | Select-Object Name, StartType

# Shows status of service
Get-Service -name "*Spooler*"

# Shows anything that breaks if *Spooler* stops
Get-Service -Name "*Spooler*" -DependentServices

# Shows anything *Spooler* itself needs running first.
Get-Service -Name "*Spooler*" -RequiredServices

# Stops a service
Stop-Service -Name "*Spooler*"

# Starts a service
Start-Service -Name "*Spooler*" 

# Changes a service start up type
Set-Service -Name "*Spooler*" -StartupType Manual
