#
# check_bios_pass.ps1
#
if (!(Get-Module -ListAvailable -Name DellBIOSProvider))
{
	Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
	Register-PSRepository -Name PSGallery -SourceLocation https://www.powershellgallery.com/api/v2/ -PublishLocation https://www.powershellgallery.com/api/v2/package/ -ScriptSourceLocation https://www.powershellgallery.com/api/v2/items/psscript/ -ScriptPublishLocation https://www.powershellgallery.com/api/v2/package/ -InstallationPolicy Trusted -PackageManagementProvider NuGet
	Install-Module -Name DellBIOSProvider -Force
}
Import-Module DellBIOSProvider

$check=ls DellSmbios:\Security\IsAdminPasswordSet | select-object -ExpandProperty CurrentValue

If( $check -like "*alse")
{
	Set-Item -Path DellSmbios:\Security\AdminPassword "dell#bios2020"
}