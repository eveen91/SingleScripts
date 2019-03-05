#
# ps_remote_win7.ps1
#
#Skip network location setting for pre-Vista operating systems 

if([environment]::OSVersion.version.Major -lt 6) { return } 
if(1,3,4,5 -contains (Get-WmiObject win32_computersystem).DomainRole) { return } 
$networkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}")) 
$connections = $networkListManager.GetNetworkConnections() 
$connections | % {$_.GetNetwork().SetCategory(1)}
Set-Item WSMan:\localhost\Client\TrustedHosts *
Enable-PSRemoting -Force