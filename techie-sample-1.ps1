
$os = Get-WmiObject -class Win32_OperatingSystem
$users = Get-WmiObject -class Win32_UserAccount
$disks = Get-WmiObject -class Win32_LogicalDisk -filter "drivetype=3"

$diskObjs = @()

foreach($disk in $disks)
{
 $props = [ordered]@{Drive = $disk.DeviceID
            Space = $disk.Size 
            FreeSpace = $disk.FreeSpace
            PercentFree = ([math]::Round(($disk.FreeSpace/$disk.Size) * 100)) }
 
 $diskObj = New-Object -TypeName PSObject -Property $props

 $diskObjs += $diskObj

}

$diskObjs | ConvertTo-Html Drive, Space, Freespace, PercentFree | Out-File d:\1.html
