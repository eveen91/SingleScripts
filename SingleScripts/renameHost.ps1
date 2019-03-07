#
# renameHost.ps1
$hostname= Read-Host "Podaj nazwę hosta"

$commands={
	$hostnameNew= Read-Host "Podaj nową nazwę hosta"
	Rename-Computer -NewName "$hostnameNew" -Force -Restart -DomainCredential (Get-Credential -Credential $uname)
}
Invoke-Command -ComputerName $hostname -ScriptBlock $commands