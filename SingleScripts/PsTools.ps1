#
# PsTools.ps1
#

#main
$select=-1
while($select -ne 0 )
{
	Write-Host"lista funkcji\n"
	Write-Host"1. Raport b³êdów\n"
	Write-Host"2. Wykonaj skrypt\n"
	Write-Host"3. Instalacja modu³ów powershell\n"
	Write-Host"4. Windows Update\n"
	Write-Host"5. checklista zmian\n"
	Read-Host=$select
}