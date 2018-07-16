# Server Health Check Parameters

#------------------- Global Functions


#---------------------------------
#Password Security Policy Settings
#---------------------------------

#PasswordHistorySize

Function Test-PasswordHistoryComplient ([switch]$ActualValue) {

    if($ActualValue){
        $PasswordHistory = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordHistorySize' -and $_.precedence -eq 1}
        return $PasswordHistory.Setting
    }
    else{	
        $PasswordHistory = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordHistorySize' -and $_.precedence -eq 1}
        if(($PasswordHistory.Setting -ge 8) -and ($PasswordHistory.Setting -le 12)){
          return $true
        }
        else{return $false}  
    }
}

#MinimumPasswordAge

Function Test-MinimumPasswordAgeComplient ([switch]$ActualValue) {
    
    if($ActualValue){
        $PasswordMinAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordAge' -and $_.precedence -eq 1}
        return $PasswordMinAge.Setting
    }
    else{	
        $PasswordMinAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordAge' -and $_.precedence -eq 1}
        if($PasswordMinAge.Setting -eq 1){
          return $true
        }  
        else{return $false}
    }
}

#MaximumPasswordAge

Function Test-MaximumPasswordAgeComplient ([switch]$ActualValue) {

	if($ActualValue){
        $PasswordMaxAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MaximumPasswordAge' -and $_.precedence -eq 1}
        return $PasswordMaxAge.Setting
    }
    else{
        $PasswordMaxAge = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MaximumPasswordAge' -and $_.precedence -eq 1}
        if($PasswordMaxAge.Setting -eq 90){
          return $true
        }  
        else{return $false}
    }
}

#MinimumPasswordLength

Function Test-MinimumPasswordLengthComplient ([switch]$ActualValue) {

	if($ActualValue){
        $PasswordMinLen = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordLength' -and $_.precedence -eq 1}
        return $PasswordMinLen.Setting
    }
    else{
        $PasswordMinLen = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'MinimumPasswordLength' -and $_.precedence -eq 1}
        if($PasswordMinLen.Setting -eq 8){
          return $true
        }  
        else{return $false}
    }
}

#PasswordComplexity

Function Test-PasswordComplexityComplient ([switch]$ActualValue) {

    if($ActualValue){
        $PasswordComp = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordComplexity' -and $_.precedence -eq 1}
        return $PasswordComp.Setting
    }
    else{
        $PasswordComp = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'PasswordComplexity' -and $_.precedence -eq 1}
        if($PasswordComp.Setting -eq $true){
          return $true
        }  
        else{return $false}
    }
}

#ClearTextPassword (Store Password using reversible encryption)

Function Test-SorePasswordReversibleEncryptionComplient ([switch]$ActualValue) {
	
    if($ActualValue){
       $PasswordClearText = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'ClearTextPassword' -and $_.precedence -eq 1}
       return $PasswordClearText.Setting 
    }
    else{
        $PasswordClearText = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'ClearTextPassword' -and $_.precedence -eq 1}
        if($PasswordClearText.Setting -eq $false){
          return $true
        }  
        else{return $false}
    }
}

#LockoutBadCount (Account Lockout Thresshold)

Function Test-LockoutThresholdComplient ([switch]$ActualValue) {
	
    if($ActualValue){
       $AccountLockoutBadCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutBadCount' -and $_.precedence -eq 1}
       return $AccountLockoutBadCount.Setting
    }
    else{
        $AccountLockoutBadCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutBadCount' -and $_.precedence -eq 1}
        if(($AccountLockoutBadCount.Setting -ge 4) -and ($AccountLockoutBadCount.Setting -le 5)){
          return $true
        }  
        else{return $false}
    }
}


#LockoutDuration (Account Lockout Duration)

Function Test-LockoutDurationComplient ([switch]$ActualValue) {
	
    if($ActualValue){
        $AccountLockoutDuration = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutDuration' -and $_.precedence -eq 1}
        return $AccountLockoutDuration.Setting
    }
    else{
        $AccountLockoutDuration = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'LockoutDuration' -and $_.precedence -eq 1}
        if($AccountLockoutDuration.Setting -eq 4294967295){
          return $true
        }  
        else{return $false}
    }
}

#ResetLockoutCount (Reset Account Lockout Counter after)

Function Test-ResetLockoutCountComplient ([switch]$ActualValue) {
	
    if($ActualValue){
        $ResetAccountLockoutCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'ResetLockoutCount' -and $_.precedence -eq 1}
        return $ResetAccountLockoutCount.Setting
    }
    else{
        $ResetAccountLockoutCount = Get-CimInstance -Namespace root\rsop\computer -Query "select * from rsop_securitysettings" | Where-Object {$_.KeyName -eq 'ResetLockoutCount' -and $_.precedence -eq 1}
        if($ResetAccountLockoutCount.Setting -ge 30){
          return $true
        }  
        else{return $false}
    }
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

Function Test-AccountLogonCredentialValidationComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $CredentialValidation = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Credential Validation'}
        return $CredentialValidation.'Inclusion Setting'
    }
    else{
        $CredentialValidation = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Credential Validation'}
        if($CredentialValidation.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Logon]/[Kerberos Service Ticket Operations] 

Function Test-AccountLogonKerberosServiceTktOpsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $KerberosServiceTktOps = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Service Ticket Operations'}
        return $KerberosServiceTktOps.'Inclusion Setting'
    }
    else{
        $KerberosServiceTktOps = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Service Ticket Operations'}
        if($KerberosServiceTktOps.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}


#Category/SubCategory:  [Account Logon]/[Other Account Logon Events] 

Function Test-AccountLogonOtherAccountLogonEvntComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $OtherAccountLogonEvent = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Account Logon Events'}
        return $OtherAccountLogonEvent.'Inclusion Setting'
    }
    else{
        $OtherAccountLogonEvent = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Account Logon Events'}
        if($OtherAccountLogonEvent.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Logon]/[Kerberos Authentication Service] 

Function Test-AccountLogonKerberosAuthServiceComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $KerberosAuthService = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Authentication Service'}
        return $KerberosAuthService.'Inclusion Setting'
    }
    else{
        $KerberosAuthService = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kerberos Authentication Service'}
        if($KerberosAuthService.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Logon] 

Function Test-AuditPolLogonComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
       $AuditPolLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logon'} 
       return $AuditPolLogon.'Inclusion Setting'
    }
    else{
        $AuditPolLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logon'}
        if($AuditPolLogon.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Logoff] 

Function Test-AuditPolLogoffComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolLogoff = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logoff'}
        return $AuditPolLogoff.'Inclusion Setting'
    }
    else{
        $AuditPolLogoff = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Logoff'}
        if($AuditPolLogoff.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Account Lockout] 

Function Test-AuditPolAcctLockoutComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolAcctLockout = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Account Lockout'}
        return $AuditPolAcctLockout.'Inclusion Setting'
    }
    else{
        $AuditPolAcctLockout = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Account Lockout'}
        if($AuditPolAcctLockout.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Main Mode] 

Function Test-AuditPolIpSecMainModeComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolIpSecMainMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Main Mode'}
        return $AuditPolIpSecMainMode.'Inclusion Setting'
    }
    else{
        $AuditPolIpSecMainMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Main Mode'}
        if($AuditPolIpSecMainMode.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Quick Mode] 

Function Test-AuditPolIpSecQuickModeComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolIpSecQuickMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Quick Mode'}
        return $AuditPolIpSecQuickMode.'Inclusion Setting'
    }
    else{
        $AuditPolIpSecQuickMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Quick Mode'}
        if($AuditPolIpSecQuickMode.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[IPsec Extended Mode] 

Function Test-AuditPolIpSecExtendedModeComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolIpSecExtendedMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Extended Mode'}
        return $AuditPolIpSecExtendedMode.'Inclusion Setting'
    }
    else{
        $AuditPolIpSecExtendedMode = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Extended Mode'}
        if($AuditPolIpSecExtendedMode.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Special Logon] 

Function Test-AuditPolSpclLogonComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSpclLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Special Logon'}
        return $AuditPolSpclLogon.'Inclusion Setting'
    }
    else{
        $AuditPolSpclLogon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Special Logon'}
        if($AuditPolSpclLogon.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Other Logon/Logoff Events] 

Function Test-AuditPolOthrLogonLogoffEvntComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolOthrLogonLogoffEvnt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Logon/Logoff Events'}
        return $AuditPolOthrLogonLogoffEvnt.'Inclusion Setting'
    }
    else{
        $AuditPolOthrLogonLogoffEvnt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Logon/Logoff Events'}
        if($AuditPolOthrLogonLogoffEvnt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Logon/Logoff]/[Network Policy Server] 

Function Test-AuditPolNwPolSrvComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolNwPolSrv = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Network Policy Server'}
        return $AuditPolNwPolSrv.'Inclusion Setting'
    }
    else{
        $AuditPolNwPolSrv = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Network Policy Server'}
        if($AuditPolNwPolSrv.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[User Account Management] 

Function Test-AuditPolUsrAcctMgmtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolUsrAcctMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'User Account Management'}
        return $AuditPolUsrAcctMgmt.'Inclusion Setting'
    }
    else{
        $AuditPolUsrAcctMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'User Account Management'}
        if($AuditPolUsrAcctMgmt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[Computer Account Management] 

Function Test-AuditPolCompAcctMgmtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolCompAcctMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Computer Account Management'}
        return $AuditPolCompAcctMgmt.'Inclusion Setting'
    }
    else{
        $AuditPolCompAcctMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Computer Account Management'}
        if($AuditPolCompAcctMgmt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[Security Group Management] 

Function Test-AuditPolSecGrpMgmtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSecGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security Group Management'}
        return $AuditPolSecGrpMgmt.'Inclusion Setting'
    }
    else{
        $AuditPolSecGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security Group Management'}
        if($AuditPolSecGrpMgmt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[Distribution Group Management] 

Function Test-AuditPolDisGrpMgmtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDisGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Distribution Group Management'}
        return $AuditPolDisGrpMgmt.'Inclusion Setting'
    }
    else{
        $AuditPolDisGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Distribution Group Management'}
        if($AuditPolDisGrpMgmt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[Application Group Management] 

Function Test-AuditPolAppGrpMgmtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolAppGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Application Group Management'}
        return $AuditPolAppGrpMgmt.'Inclusion Setting'
    }
    else{
        $AuditPolAppGrpMgmt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Application Group Management'}
        if($AuditPolAppGrpMgmt.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Account Management]/[Other Account Management Events] 

Function Test-AuditPolOthrAcctMgmtEvtsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolOthrAcctMgmtEvts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Account Management Events'}
        return $AuditPolOthrAcctMgmtEvts.'Inclusion Setting'
    }
    else{
        $AuditPolOthrAcctMgmtEvts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Account Management Events'}
        if($AuditPolOthrAcctMgmtEvts.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [DS Access]/[Directory Service Access] 

Function Test-AuditPolDirSrvAccessComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDirSrvAccess = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Directory Service Access'}
        return $AuditPolDirSrvAccess.'Inclusion Setting'
    }
    else{
        $AuditPolDirSrvAccess = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Directory Service Access'}
        if($AuditPolDirSrvAccess.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [DS Access]/[Directory Service Replication] 

Function Test-AuditPolDirSrvReplComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDirSrvRepl = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Directory Service Replication'}
        return $AuditPolDirSrvRepl.'Inclusion Setting'
    }
    else{
        $AuditPolDirSrvRepl = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Directory Service Replication'}
        if($AuditPolDirSrvRepl.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [DS Access]/[Detailed Directory Service Replication] 

Function Test-AuditPolDetailedDirSrvReplComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedDirSrvRepl = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Detailed Directory Service Replication'}
        return $AuditPolDetailedDirSrvRepl.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedDirSrvRepl = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Detailed Directory Service Replication'}
        if($AuditPolDetailedDirSrvRepl.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[File System] 

Function Test-AuditPolObjAccessFileSysComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessFileSys = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'File System'}
        return $AuditPolObjAccessFileSys.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessFileSys = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'File System'}
        if($AuditPolObjAccessFileSys.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Registry] 

Function Test-AuditPolObjAccessRegComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessReg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Registry'}
        return $AuditPolObjAccessReg.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessReg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Registry'}
        if($AuditPolObjAccessReg.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Kernel Object] 

Function Test-AuditPolObjAccessKrnlObjComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessKrnlObj = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kernel Object'}
        return $AuditPolObjAccessKrnlObj.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessKrnlObj = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Kernel Object'}
        if($AuditPolObjAccessKrnlObj.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[SAM] 

Function Test-AuditPolObjAccessSAMComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessSAM = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'SAM'}
        return $AuditPolObjAccessSAM.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessSAM = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'SAM'}
        if($AuditPolObjAccessSAM.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Certification Services] 

Function Test-AuditPolObjAccessCertSrvComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessCertSrv = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Certification Services'}
        return $AuditPolObjAccessCertSrv.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessCertSrv = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Certification Services'}
        if($AuditPolObjAccessCertSrv.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Application Generated] 

Function Test-AuditPolObjAccessAppGenComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessAppGen = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Application Generated'}
        return $AuditPolObjAccessAppGen.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessAppGen = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Application Generated'}
        if($AuditPolObjAccessAppGen.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Handle Manipulation] 

Function Test-AuditPolObjAccessHndlMnpComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessHndlMnp = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Handle Manipulation'}
        return $AuditPolObjAccessHndlMnp.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessHndlMnp = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Handle Manipulation'}
        if($AuditPolObjAccessHndlMnp.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[File Share] 

Function Test-AuditPolObjAccessFileShrComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessFileShr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'File Share'}
        return $AuditPolObjAccessFileShr.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessFileShr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'File Share'}
        if($AuditPolObjAccessFileShr.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Filtering Platform Packet Drop] 

Function Test-AuditPolObjAccessFltrPltfrmPktDrpComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessFltrPltfrmPktDrp = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Packet Drop'}
        return $AuditPolObjAccessFltrPltfrmPktDrp.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessFltrPltfrmPktDrp = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Packet Drop'}
        if($AuditPolObjAccessFltrPltfrmPktDrp.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Filtering Platform Connection] 

Function Test-AuditPolObjAccessFltrPltfrmConComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessFltrPltfrmCon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Connection'}
        return $AuditPolObjAccessFltrPltfrmCon.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessFltrPltfrmCon = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Connection'}
        if($AuditPolObjAccessFltrPltfrmCon.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Other Object Access Events] 

Function Test-AuditPolObjAccessOthrObjAccessEvntsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessOthrObjAccessEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Object Access Events'}
        return $AuditPolObjAccessOthrObjAccessEvnts.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessOthrObjAccessEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Object Access Events'}
        if($AuditPolObjAccessOthrObjAccessEvnts.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Object Access]/[Detailed File Share] 

Function Test-AuditPolObjAccessDetailedFilShrComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolObjAccessDetailedFilShr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Detailed File Share'}
        return $AuditPolObjAccessDetailedFilShr.'Inclusion Setting'
    }
    else{
        $AuditPolObjAccessDetailedFilShr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Detailed File Share'}
        if($AuditPolObjAccessDetailedFilShr.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[Audit Policy Change] 

Function Test-AuditPolAdtPolChgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolAdtPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Audit Policy Change'}
        return $AuditPolAdtPolChg.'Inclusion Setting'
    }
    else{
        $AuditPolAdtPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Audit Policy Change'}
        if($AuditPolAdtPolChg.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[Authentication Policy Change] 

Function Test-AuditPolAuthPolChgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolAuthPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Authentication Policy Change'}
        return $AuditPolAuthPolChg.'Inclusion Setting'
    }
    else{
        $AuditPolAuthPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Authentication Policy Change'}
        if($AuditPolAuthPolChg.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[Authorization Policy Change] 

Function Test-AuditPolAthrzPolChgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolAthrzPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Authorization Policy Change'}
        return $AuditPolAthrzPolChg.'Inclusion Setting'
    }
    else{
        $AuditPolAthrzPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Authorization Policy Change'}
        if($AuditPolAthrzPolChg.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[MPSSVC Rule-Level Policy Change] 

Function Test-AuditPolMPSSVCchgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolMPSSVCchg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'MPSSVC Rule-Level Policy Change'}
        return $AuditPolMPSSVCchg.'Inclusion Setting'
    }
    else{
        $AuditPolMPSSVCchg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'MPSSVC Rule-Level Policy Change'}
        if($AuditPolMPSSVCchg.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[Filtering Platform Policy Change] 

Function Test-AuditPolFltrPltPolChgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolFltrPltPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Policy Change'}
        return $AuditPolFltrPltPolChg.'Inclusion Setting'
    }
    else{
        $AuditPolFltrPltPolChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Filtering Platform Policy Change'}
        if($AuditPolFltrPltPolChg.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Policy Change]/[Other Policy Change Events] 

Function Test-AuditPolOthPolChgEvntsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolOthPolChgEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Policy Change Events'}
        return $AuditPolOthPolChgEvnts.'Inclusion Setting'
    }
    else{
        $AuditPolOthPolChgEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Policy Change Events'}
        if($AuditPolOthPolChgEvnts.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Privilege Use]/[Sensitive Privilege Use] 

Function Test-AuditPolSnstPrvlgUseComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSnstPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Sensitive Privilege Use'}
        return $AuditPolSnstPrvlgUse.'Inclusion Setting'
    }
    else{
        $AuditPolSnstPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Sensitive Privilege Use'}
        if($AuditPolSnstPrvlgUse.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Privilege Use]/[Non Sensitive Privilege Use] 

Function Test-AuditPolNonSnstPrvlgUseComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolNonSnstPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Non Sensitive Privilege Use'}
        return $AuditPolNonSnstPrvlgUse.'Inclusion Setting'
    }
    else{
        $AuditPolNonSnstPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Non Sensitive Privilege Use'}
        if($AuditPolNonSnstPrvlgUse.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Privilege Use]/[Other Privilege Use Events] 

Function Test-AuditPolOthrPrvlgUseComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolOthrPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Privilege Use Events'}
        return $AuditPolOthrPrvlgUse.'Inclusion Setting'
    }
    else{
        $AuditPolOthrPrvlgUse = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other Privilege Use Events'}
        if($AuditPolOthrPrvlgUse.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Detailed Tracking]/[Process Creation] 

Function Test-AuditPolDetailedTrckProcCreationComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedTrckProcCreation = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Process Creation'}
        return $AuditPolDetailedTrckProcCreation.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedTrckProcCreation = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Process Creation'}
        if($AuditPolDetailedTrckProcCreation.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Detailed Tracking]/[Process Termination] 

Function Test-AuditPolDetailedTrckProcTermComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedTrckProcTerm = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Process Termination'}
        return $AuditPolDetailedTrckProcTerm.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedTrckProcTerm = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Process Termination'}
        if($AuditPolDetailedTrckProcTerm.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Detailed Tracking]/[DPAPI Activity] 

Function Test-AuditPolDetailedTrckDPAPIactComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedTrckDPAPIact = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'DPAPI Activity'}
        return $AuditPolDetailedTrckDPAPIact.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedTrckDPAPIact = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'DPAPI Activity'}
        if($AuditPolDetailedTrckDPAPIact.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Detailed Tracking]/[DPAPI Activity] 

Function Test-AuditPolDetailedTrckDPAPIactComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedTrckDPAPIact = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'DPAPI Activity'}
        return $AuditPolDetailedTrckDPAPIact.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedTrckDPAPIact = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'DPAPI Activity'}
        if($AuditPolDetailedTrckDPAPIact.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [Detailed Tracking]/[RPC Events] 

Function Test-AuditPolDetailedTrckRPCevntsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolDetailedTrckRPCevnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'RPC Events'}
        return $AuditPolDetailedTrckRPCevnts.'Inclusion Setting'
    }
    else{
        $AuditPolDetailedTrckRPCevnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'RPC Events'}
        if($AuditPolDetailedTrckRPCevnts.'Inclusion Setting' -eq "Success and Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [System]/[Security State Change] 

Function Test-AuditPolSysSecStChgComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSysSecStChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security State Change'}
        return $AuditPolSysSecStChg.'Inclusion Setting'
    }
    else{
        $AuditPolSysSecStChg = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security State Change'}
        if($AuditPolSysSecStChg.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [System]/[Security System Extension] 

Function Test-AuditPolSysSecSysExtComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSysSecSysExt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security System Extension'}
        return $AuditPolSysSecSysExt.'Inclusion Setting'
    }
    else{
        $AuditPolSysSecSysExt = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Security System Extension'}
        if($AuditPolSysSecSysExt.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [System]/[System Integrity] 

Function Test-AuditPolSysIntegrityComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSysIntegrity = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'System Integrity'}
        return $AuditPolSysIntegrity.'Inclusion Setting'
    }
    else{
        $AuditPolSysIntegrity = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'System Integrity'}
        if($AuditPolSysIntegrity.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [System]/[IPsec Driver] 

Function Test-AuditPolSysIPsecDrvrComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSysIPsecDrvr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Driver'}
        return $AuditPolSysIPsecDrvr.'Inclusion Setting'
    }
    else{
        $AuditPolSysIPsecDrvr = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'IPsec Driver'}
        if($AuditPolSysIPsecDrvr.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}

#Category/SubCategory:  [System]/[Other System Events] 

Function Test-AuditPolSysOthrSysEvntsComplient ([parameter(mandatory)][ValidateNotNullorEmpty()]$AdvanceAuditPolSettingsObject, [switch]$ActualValue) {
	
    if($ActualValue){
        $AuditPolSysOthrSysEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other System Events'}
        return $AuditPolSysOthrSysEvnts.'Inclusion Setting'
    }
    else{
        $AuditPolSysOthrSysEvnts = $AdvanceAuditPolSettingsObject | Where-Object {$_.Subcategory -eq 'Other System Events'}
        if($AuditPolSysOthrSysEvnts.'Inclusion Setting' -eq "Failure"){
          return $true
        }  
        else{return $false}
    }
}


#--------
#  Main
#--------
cls
$AdvanceAuditPolSettingsObject = Get-AdvanceAuditPolSettings
Test-AuditPolSysOthrSysEvntsComplient -AdvanceAuditPolSettingsObject $AdvanceAuditPolSettingsObject 

