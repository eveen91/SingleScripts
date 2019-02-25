#
# psVersionLog.ps1
#
$env:computername | Out-File -FilePath \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\win7_psversion.txt -NoClobber -Append
$PSVersionTable.PSVersion | Out-File -FilePath \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\win7_psversion.txt -NoClobber -Append