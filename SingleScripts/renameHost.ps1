#
# renameHost.ps1
$hostname= Read-Host "Podaj nazwê hosta"

$commands={
	$hostnameNew= Read-Host "Podaj nazwê now¹ hosta"
	Rename-Computer -NewName "$hostnameNew" -Force -Restart -DomainCredential (Get-Credential -Credential $uname)
}
Invoke-Command -ComputerName $hostname -ScriptBlock $commands