#
# EsetUpdate.ps1
#
$date=Get-Date -UFormat "%Y-%m-%d"
$hostname=hostname
function log($msg)
{
	$destination="C:\Users\vectrauser\AppData\Local\DwiTools\logs\"
	if( -Not (Test-Path -Path $destination ) )
	{
		New-Item -ItemType directory -Path $destination
	}
	Write-Host $msg | Out-File C:\Users\vectrauser\AppData\Local\DwiTools\logs\$hostname$date"-EsetUpdate.txt" -Append
}
function copyeset()
{
	$destination="C:\nowy"
	if( -Not (Test-Path -Path $destination ) )
	{
		New-Item -ItemType directory -Path $destination
	}
	(Get-Item c:\nowy\).Attributes="Hidden"
	log("kopiowanie instalki")
	$model = (Get-WmiObject -Class Win32_ComputerSystem).Model
	if ($model -like "*latitude*" -or $model -like "*xps*" -or $model -like "*thinkpad*" ){
		Copy-Item '\\192.168.180.20\public\EES\ERA_Installer_x64_en_US.exe' -Destination $destination
	}
	Else{
			Copy-Item '\\192.168.180.20\public\EEA\ERA_Installer_x64_en_US.exe' -Destination $destination
	}
}

try{
	Get-Process -Name ekrn -ErrorAction Stop
	log("Stop ekrn")
	Stop-Process -Name ekrn -Force
	log("Wy³¹czenie us³ugi ekrn")
	Set-Service -Name ekrn -Status Stopped -StartupType Disabled
	copyeset
# copy xml
	log("zmieniam œcie¿kê")
	Rename-Item 'C:\Program Files\ESET' 'C:\Program Files\ESET Endpoint Security_'
	log("ustawienie instalacji po reboocie")
	schtasks.exe /Create /XML "C:\nowy\EsetUpdate.xml" /TN "\EsetUpdate"
	log("reboot")
	Restart-Computer
}
catch
{
	log("no Eset")
	copyeset
	log("instalacja eseta")
	Start-Process C:\nowy\ERA_Installer_x64_en_US.exe -ArgumentList "--silent --accepteula" -Wait
	log("reboot")
	Restart-Computer
}