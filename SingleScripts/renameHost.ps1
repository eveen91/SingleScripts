#
# renameHost.ps1
#
#$hostname = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
#$hostname = $hostname + "-lap"
$rename= { 
	Rename-Computer -NewName "$hostnameNew" -Force 
	Restart-Computer 
}
$hostname= Read-Host "Podaj nazwê now¹ hosta"
$hostnameNew= Read-Host "Podaj nazwê now¹ hosta"
$uname= Read-Host "podaj login:"
$pass= Read-Host "podaj has³o:"
$secstr = ConvertTo-SecureString $pass -AsPlainText -Force
$newcred = New-Object System.Management.Automation.PSCredential ($uname,$secstr)
Invoke-Command -ComputerName $hostname -ScriptBlock $rename -credential $newcred
