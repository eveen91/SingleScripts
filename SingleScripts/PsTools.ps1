#
# PsTools.ps1
#

#main
$select=99
while($select -ne 0 )
{
	Write-Host "lista funkcji"
	Write-Host "1. Raport b��d�w"
	Write-Host "2. Wykonaj skrypt"
	Write-Host "3. Instalacja modu��w powershell"
	Write-Host "4. Windows Update"
	Write-Host "5. checklista zmian"
	$select=Read-Host
}