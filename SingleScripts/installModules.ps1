#
# installModules.ps1
#
Copy-Item \\VCGDYPWVLS01\Installers\Modules -Destination C:\Windows\System32\WindowsPowerShell\v1.0\Modules -Recurse

$modules = Get-ChildItem "C:\Windows\System32\WindowsPowerShell\v1.0\Modules\"
foreach ($m in $modules)
{
    Import-Module -Name $m
}