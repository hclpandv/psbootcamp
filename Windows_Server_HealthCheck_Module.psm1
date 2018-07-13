# Server Health Check Parameters

#------------------- Global Functions


#---------------------------------
#Password Security Policy Settings
#---------------------------------

#PasswordHistorySize

Function Test-PasswordHistoryComplient () {
	
    $PasswordHistory = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordHistorySize' -and $_.precedence -eq 1}
    if(($PasswordHistory.Setting -ge 8) -and ($PasswordHistory.Setting -le 12)){
      return $true
    }
    else{return $false}  
}


#MinimumPasswordAge

Function Test-MinimumPasswordAgeComplient () {
	
    $PasswordMinAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordAge' -and $_.precedence -eq 1}
    if($PasswordMinAge.Setting -eq 1){
      return $true
    }  
    else{return $false}
}

#MaximumPasswordAge

Function Test-MaximumPasswordAgeComplient () {
	
    $PasswordMaxAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MaximumPasswordAge' -and $_.precedence -eq 1}
    if($PasswordMaxAge.Setting -eq 90){
      return $true
    }  
    else{return $false}
}

#MinimumPasswordLength

Function Test-MinimumPasswordLengthComplient () {
	
    $PasswordMinLen = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordLength' -and $_.precedence -eq 1}
    if($PasswordMinLen.Setting -eq 8){
      return $true
    }  
    else{return $false}
}

#PasswordComplexity

Function Test-PasswordComplexityComplient () {
	
    $PasswordComp = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordComplexity' -and $_.precedence -eq 1}
    if($PasswordComp.Setting -eq $true){
      return $true
    }  
    else{return $false}
}

#ClearTextPassword (Store Password using reversible encryption)

Function Test-SorePasswordReversibleEncryptionComplient () {
	
    $PasswordClearText = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'ClearTextPassword' -and $_.precedence -eq 1}
    if($PasswordClearText.Setting -eq $false){
      return $true
    }  
    else{return $false}
}

#LockoutBadCount (Account Lockout Thresshold)

Function Test-LockoutThresholdComplient () {
	
    $AccountLockoutBadCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutBadCount' -and $_.precedence -eq 1}
    if(($AccountLockoutBadCount.Setting -ge 4) -and ($AccountLockoutBadCount.Setting -le 5)){
      return $true
    }  
    else{return $false}
}

#LockoutDuration (Account Lockout Duration)

Function Test-LockoutDurationComplient () {
	
    $AccountLockoutDuration = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutDuration' -and $_.precedence -eq 1}
    if($AccountLockoutDuration.Setting -eq 4294967295){
      return $true
    }  
    else{return $false}
}

#ResetLockoutCount (Reset Account Lockout Counter after)

Function Test-ResetLockoutCountComplient () {
	
    $ResetAccountLockoutCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutDuration' -and $_.precedence -eq 1}
    if($ResetAccountLockoutCount.Setting -ge 30){
      return $true
    }  
    else{return $false}
}


#[Data Supplier Function]

Function Get-AdvanceAuditPolSettings () {

    $AdvanceAuditPolSettings = @()
    $AuditPol_Report = "$env:LogFiles\Audit_Report_temp.csv"
    if(Test-Path $AuditPol_Report){Remove-Item -Path $AuditPol_Report -Force}

    try{
        $Process = [Diagnostics.Process]::Start("auditpol.exe", "/backup /file:$($AuditPol_Report)")
        $Process.WaitForExit()
        if($?){
           $AdvanceAuditPolSettings = import-csv $AuditPol_Report
           Remove-Item -Path $AuditPol_Report -Force
        }
        return $AdvanceAuditPolSettings
    }
    catch{
       Write-Error "Error while accessing Advanced Audit Pol Settings"
    }
}

#------------------------------
#Advanced Audit Policy Settings
#------------------------------
 
#Category/SubCategory:  [Account Logon]/[Credential Validation] 

Function Test-AccountLogonCredentialValidationComplient ($AdvanceAuditPolSettingsObject) {
	
    $CredentialValidation = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Credential Validation'}
    if($CredentialValidation.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Account Logon]/[Kerberos Service Ticket Operations] 

Function Test-AccountLogonKerberosServiceTktOpsComplient ($AdvanceAuditPolSettingsObject) {
	
    $KerberosServiceTktOps = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Service Ticket Operations'}
    if($KerberosServiceTktOps.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Account Logon]/[Other Account Logon Events] 

Function Test-AccountLogonOtherAccountLogonEvntComplient ($AdvanceAuditPolSettingsObject) {
	
    $OtherAccountLogonEvent = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Account Logon Events'}
    if($OtherAccountLogonEvent.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}


#Category/SubCategory:  [Account Logon]/[Kerberos Authentication Service] 

Function Test-AccountLogonKerberosAuthServiceComplient ($AdvanceAuditPolSettingsObject) {
	
    $KerberosAuthService = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Authentication Service'}
    if($KerberosAuthService.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Logon] 

Function Test-AuditPolLogonComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logon'}
    if($AuditPolLogon.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Logoff] 

Function Test-AuditPolLogoffComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolLogoff = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logoff'}
    if($AuditPolLogoff.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Account Lockout] 

Function Test-AuditPolAcctLockoutComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolAcctLockout = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Account Lockout'}
    if($AuditPolAcctLockout.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Main Mode] 

Function Test-AuditPolIpSecMainModeComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolIpSecMainMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Main Mode'}
    if($AuditPolIpSecMainMode.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Quick Mode] 

Function Test-AuditPolIpSecQuickModeComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolIpSecQuickMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Quick Mode'}
    if($AuditPolIpSecQuickMode.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Extended Mode] 

Function Test-AuditPolIpSecExtendedModeComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolIpSecExtendedMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Extended Mode'}
    if($AuditPolIpSecExtendedMode.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Special Logon] 

Function Test-AuditPolSpclLogonComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolSpclLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Special Logon'}
    if($AuditPolSpclLogon.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Other Logon/Logoff Events] 

Function Test-AuditPolOthrLogonLogoffEvntComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolOthrLogonLogoffEvnt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Logon/Logoff Events'}
    if($AuditPolOthrLogonLogoffEvnt.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#Category/SubCategory:  [Logon/Logoff]/[Network Policy Server] 

Function Test-AuditPolNwPolSrvComplient ($AdvanceAuditPolSettingsObject) {
	
    $AuditPolNwPolSrvComplient = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Network Policy Server'}
    if($AuditPolNwPolSrvComplient.'Inclusion Setting' -eq "Success and Failure"){
      return $true
    }  
    else{return $false}
}

#--------
#  Main
#--------
cls
$AdvanceAuditPolSettingsObject = Get-AdvanceAuditPolSettings
Test-AccountLogonKerberosAuthServiceComplient -AdvanceAuditPolSettingsObject $AdvanceAuditPolSettingsObject
