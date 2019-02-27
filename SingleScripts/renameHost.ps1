#
# renameHost.ps1
#
#$hostname = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
#$hostname = $hostname + "-lap"
$rename= { 
	Rename-Computer -NewName "$hostnameNew" -Force 
	Restart-Computer 
}
$hostname= Read-Host "Podaj obecn� nazw� hosta"
$hostnameNew= Read-Host "Podaj now� nazw� hosta"
$uname= Read-Host "Podaj sw�j login domenowy"
$pass= Read-Host "Podaj swoje has�o domenowe"
$secstr = ConvertTo-SecureString $pass -AsPlainText -Force
$newcred = New-Object System.Management.Automation.PSCredential ($uname,$secstr)
Invoke-Command -ComputerName $hostname -ScriptBlock $rename -credential $newcred
