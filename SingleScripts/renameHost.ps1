#
# renameHost.ps1
$hostname= Read-Host "Podaj nazw� hosta"

$commands={
	$hostnameNew= Read-Host "Podaj nazw� now� hosta"
	Rename-Computer -NewName "$hostnameNew" -Force -Restart -DomainCredential (Get-Credential -Credential $uname)
}
Invoke-Command -ComputerName $hostname -ScriptBlock $commands