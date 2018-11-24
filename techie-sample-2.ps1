Function Get-CustomInventory () {
        $osInfo = Get-WmiObject win32_OperatingSystem
        $diskInfo = Get-WmiObject win32_LogicalDisk -Filter "drivetype=3"

        $Psversion = $PSVersionTable.PSVersion

        $ver = $osInfo.Version.Split(".")
        $OsVersion = $ver[0]+ "." + $ver[1]

        $CDriveSpGb = [math]::round((($diskInfo | Where-Object {$_.DeviceID -eq "C:"}).FreeSpace / 1GB), 2)

        $output = "" | select ps_version, os_version, c_disk_space_gb

        $output.ps_version = $Psversion
        $output.os_version = $OsVersion
        $output.c_disk_space_gb = $CDriveSpGb

        Write-Output $output 

}
