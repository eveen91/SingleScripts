#
# PsTools.ps1
#
$destination= 'C:\Users\vectrauser\AppData\Local\DwiTools\'

if( -Not (Test-Path -Path $destination ) )
{
   New-Item -ItemType directory -Path $destination
}
Invoke-WebRequest -Uri https://www.dropbox.com/sh/q0ebixtjz0vf62a/AADf3C4EM-0tK5rZjohWmc1Va?dl=1 -OutFile $destination"tools.zip"
#Invoke-WebRequest -Uri https://www.dropbox.com/s/riheysgjtiz1eag/PsModulesList.txt?dl=1 -OutFile $destination"PsModulesList.txt"
Expand-Archive C:\Users\vectrauser\AppData\Local\DwiTools\tools.zip -DestinationPath C:\Users\vectrauser\AppData\Local\DwiTools\
Remove-Item C:\Users\vectrauser\AppData\Local\DwiTools\tools.zip
