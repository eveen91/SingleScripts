#
# renameHost.ps1
#
#$hostname = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
#$hostname = $hostname + "-lap"
$hostname= Read-Host "Podaj nazw� now� hosta"
$hostnameNew= Read-Host "Podaj nazw� now� hosta"
$uname= Read-Host "podaj login:"
$pass= Read-Host "podaj has�o:"
$secstr = ConvertTo-SecureString $pass -AsPlainText -Force
$newcred = New-Object System.Management.Automation.PSCredential ($uname,$secstr)
Invoke-Command -ComputerName $hostname -ScriptBlock { Rename-Computer -NewName "$hostnameNew" -Force | Restart-Computer } -credential $newcred
