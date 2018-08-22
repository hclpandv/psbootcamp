
#-------------------------------------------------------------------------------
#  Function   Get-OSVersion
#  Purpose    Retrieves the OS version information and writes it to the log
#  Returns    the (short) OS name
# 
#  Example    $OSVersion = Get-OSVersion -Name $Computer
#             Writes long info to screen and saves short OS name to $OSVersion
#-------------------------------------------------------------------------------
Function Get-OSVersion {
    Param (
        [Parameter(Mandatory = $True)] [String] $Name
    )

    $Win32_OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $Name
    $OSVersion = "Win2008R2"

    Switch ($Win32_OS.BuildNumber) {
        "2600" { $OSVersion = "WinXP";   Break }
        "3790" { $OSVersion = "Win2003"; Break }
        "[6000-6001]" { If ($Win32_OS.caption -match "Vista")     { $OSVersion = "WinVista" } Else { $OSVersion = "Win2008" };   Break }
        "[7100-7601]" { If ($Win32_OS.Caption -match "Windows 7") { $OSVersion = "Win7" }     Else { $OSVersion = "Win2008R2" }; Break }
        "[9200-9999]" { If ($Win32_OS.Caption -match "Windows 8") { $OSVersion = "Win8" }     Else { $OSVersion = "Win2012" };   Break }
    }

    $OSFullDescription = " $($Win32_OS.Caption.TrimEnd())"

    If (!($Win32_OS.ServicePackMajorVersion -eq 0)) {
    $OSFullDescription += " SP$($Win32_OS.ServicePackMajorVersion)"
    }

    Write-Log $OSFullDescription

    Return $OSVersion
}

#-------------------------------------------------------------------------------
#  Function   Check-ExitCode
#  Purpose    Retrieves the error code from the last executed program and
#             converts the error into a successful or failed exit code, then
#             writes the result to log or exits with error code.
#  Returns    nothing
# 
#  Example    Check-ExitCode -Code $LastExitCode
#-------------------------------------------------------------------------------
Function Check-ExitCode {
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)] [Int] $Code
    )

    Process {
        Switch ($Code) {
            1203  { $Code = 0 }                                       # ERROR_NO_NET_OR_BAD_PATH
            1605  { $Code = 0 }                                       # ERROR_UNKNOWN_PRODUCT
            1641  { $Code = 0; $ExtraMessage = " Reboot initiated." } # ERROR_SUCCESS_REBOOT_INITIATED
            3010  { $Code = 0; $ExtraMessage = " Reboot required."  } # ERROR_SUCCESS_REBOOT_REQUIRED
        }
       
        If ($Code -ne 0) {
            Write-Log -Message "Execution failed!" -Type "Error"
            Throw "Exited with error code: $Code"
        }
        
        Write-Log -Message "Execution successful. $ExtraMessage" -Type "Success"
    }
}


#-------------------------------------------------------------------------------
#  Function   Expand-ZIPFile
#  Purpose    Unzip a zipfile to a specific destination
#  Returns    $true on OK, $false on error.
# 
#  Example1   Expand-ZIPFile \96File \93C:\A.zip\94 \96Destination \93C:\temp\\94
#             Unzips A.zip to folder c:\temp.
#-------------------------------------------------------------------------------
function Expand-ZIPFile($file, $destination) {
    $shell = new-object -com shell.application
    $ZIPfile = $shell.NameSpace($file)
    foreach($item in $zip.items()) {
        $shell.Namespace($destination).copyhere($item)
    }
}


#-------------------------------------------------------------------------------
#  Function   Set-security
#  Purpose    Set security on a folder
#  Returns    $true on OK, $false on error.
# 
#  Example    Set-security "d:\install" "Modify" "AccountName"
#             Grants modify permissions to user AccountName on folder d:\install
#             (You can grant "Read", "Modify", "Execute" or "Full")
#-------------------------------------------------------------------------------
Function Set-Security {
    Param ([string]$Folder, [String]$Permission, [string]$Username)


    $ACL = Get-ACL $Folder
    $ACL.SetAccessRuleProtection($False, $False)
    $ACL.AddAccessRule((New-Object System.Security.AccessControl.FileSystemAccessRule($Username,$Permission, "ContainerInherit, ObjectInherit", "None", "Allow")))
    Set-ACL $Folder $ACL
}
