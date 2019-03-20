#
# PsTools.ps1
#

function list_scripts()
{

}

#main
$select=99
while($select -ne 0 )
{
	Write-Host "lista funkcji"
	Write-Host "1. Raport b³êdów"
	Write-Host "2. Wykonaj skrypt"
	Write-Host "3. Instalacja modu³ów powershell"
	Write-Host "4. Windows Update"
	Write-Host "5. checklista zmian"
	Write-Host "6. Update to 1809"
	$select=Read-Host
	switch ($select)
	{
		'1' {C:\Users\vectrauser\AppData\Local\DwiTools\Smartctl\smartctl.exe -a /dev/sda ; break}
		'2' {}
		'3' {}
		'4' {}
		'5' {}
		'6' {}
	
	}
}