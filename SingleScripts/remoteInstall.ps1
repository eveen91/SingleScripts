#
# remoteInstall.ps1
#
$NAZWAHOSTA = Read-Host -Prompt 'Nazwa hosta'
$COMMAND

Enter-PSSession -ComputerName $NAZWAHOSTA

$COMMAND= Read-Host -Prompt 'Podaj komende do wykonania,exit=0'
while ($COMMAND -ne '0')
{
  # if (Test-Path -Path \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\$NAZWAHOSTA.txt -pathtype Leaf)
  #  {
  #      New-Item \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\$NAZWAHOSTA.txt -ItemType file
  #  }
    Get-Date -Format g | Out-File -FilePath \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\$NAZWAHOSTA.txt -NoClobber -Append
    Invoke-Expression $COMMAND | Out-File -FilePath \\VCGDYSRNAS01\dwi\PUBLIC\LOGS\$NAZWAHOSTA.txt -NoClobber -Append
    $COMMAND= Read-Host -Prompt 'Podaj komende do wykonania,exit=0'
}
exit