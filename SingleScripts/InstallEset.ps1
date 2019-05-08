#
# InstallEset.ps1
#
$date=Get-Date -UFormat "%Y-%m-%d"
$hostname=hostname
function log($msg)
{
Write-Host $msg | Out-File C:\Users\vectrauser\AppData\Local\DwiTools\logs\$hostname$date"-EsetUpdate.txt" -Append
}

log("instalacja eseta")
Start-Process C:\nowy\ERA_Installer_x64_en_US.exe -ArgumentList "--silent --accepteula" -Wait
log("usuwanie tasku")
Unregister-ScheduledTask -TaskName EsetUpdate -Confirm:$false
log("przywrócenie us³ugi")
Set-Service -Name ekrn -Status Running -StartupType Automatic
log("reboot")
Restart-Computer