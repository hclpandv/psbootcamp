<#
   Script Name : wha
   com

#>

#------------------ Global Variable -------------------------
$ScriptName = "Something.ps1"
$LogName = "$($ScriptName.Split('.')[0])-$(get-date -format 'yyyy-MM-dd-hh-mm').log" 
$Logfile = "$env:TEMP\$LogName"


#------------------ Global Functions
Function Write-Log($msg, $status){
    Write-Host "[$status] [$msg]"
    "[$status] [$msg]" | Out-File $Logfile -Append

}

# ---------------- Main Script

$osInfo = Get-WmiObject win32_OperatingSystem
$diskInfo = Get-WmiObject win32_LogicalDisk -Filter "drivetype=3"


Write-Log -msg "Calculating PS Version" -status "INFO"
$Psversion = $PSVersionTable.PSVersion

Write-Log -msg "Calculating OS Version" -status "INFO"

$ver = $osInfo.Version.Split(".")
$OsVersion = $ver[0]+ "." + $ver[1]

if($OsVersion -eq "10.0"){

   Write-Log -msg "Sorry This script is only suppoerted on Server OS. this is a client OS" -status "ERROR"

}

$CDriveSpGb = [math]::round((($diskInfo | Where-Object {$_.DeviceID -eq "C:"}).FreeSpace / 1GB), 2)

$output = "" | select ps_version, os_version, c_disk_space_gb

$output.ps_version = $Psversion
$output.os_version = $OsVersion
$output.c_disk_space_gb = $CDriveSpGb

Write-Output $output 
