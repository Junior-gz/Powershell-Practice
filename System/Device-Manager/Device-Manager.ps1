*Anything in the stars is an example


# Lists all plug and play devices with basic status
Get-PnpDevice

# Filters to devices showing a problem
Get-PnpDevice -Status Error

# Filters to a specific device catagory
Fet-PnpDevice -Class "*Net*"

# All the class names in the system
Get-PnpDevice | Select-Object -Property Class -Unique

# Gets the specific driver details properties for one device (More advanced)
Get-PnpDeviceProperty -InstanceId <DeviceID> -KeyName "*DEVPKEY_Device_DriverVersion*"

# Shows how many devices there are
Get-PnpDevice | Measure-Object
