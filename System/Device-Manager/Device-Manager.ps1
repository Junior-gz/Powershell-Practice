*Anything in the stars is an example


# Lists all plug and play devices with basic status
Get-PnpDevice

# Filters to devices showing a problem
Get-PnpDevice -Status Error

# Shows unknown devices
Get-PnpDevice -Status Error

# Filters to a specific device catagory
Get-PnpDevice -Class "*Net*"

# All the class names in the system
Get-PnpDevice | Select-Object -Property Class -Unique

# Gets the specific driver details properties for one device (More advanced)
Get-PnpDeviceProperty -InstanceId <DeviceID> -KeyName "*DEVPKEY_Device_DriverVersion*"

# Shows how many devices there are
Get-PnpDevice | Measure-Object

# Shows device hardware ID
Get-PnpDevice | Where-Object {$_.FriendlyName -like "*NVIDIA*"} | Select-Object FriendlyName, Class, Status, InstanceId (Needs star, but is still a example)

# Shows the friendly name of the device
Get-PnpDevice -FriendlyName "*Integrated Camera*" (Needs star, but is still a example)

# Expands ID
Get-PnpDevice -FriendlyName "*Integrated camera*" | Select-Object -ExpandProperty InstanceId

# Disables Device
Disable-PnpDevice -InstanceId "<InstanceID>" -Confirm:$false

# Enables Device
Enable-PnpDevice -InstanceId "<InstanceID>" -Confirm:$false

# Dumps every property of device
Get-PnpDevice -FriendlyName "*Integrated camera*" | Format-List * (Stars are needed but still an example)