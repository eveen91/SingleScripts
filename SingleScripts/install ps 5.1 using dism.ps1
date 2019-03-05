#
# install_ps_5.ps1
#
$sys=[IntPtr]::Size

If($sys -eq 4){
	$list=Get-ChildItem -Path c:\nowy\ -Include *x86.cab
}
else{
	$list=Get-ChildItem -Path c:\nowy\ -Include *x64.cab
}


foreach ($a in $list)
{
	DISM.exe /Online /Add-Package /PackagePath:c:\nowy\$a
}
Restart-Computer