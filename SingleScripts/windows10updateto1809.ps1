#
# windows10updateto1809.ps1
#
#test if path exist
$destination= 'C:\Users\vectrauser\AppData\Local\DwiTools\'

if( -Not (Test-Path -Path $destination ) )
{
   New-Item -ItemType directory -Path $destination
}

#copy iso
New-PSDrive -Name source -PSProvider FileSystem -Root \\vcgdysrnas01\dwi\PUBLIC\ | Out-Null
#New-PSDrive -Name source -PSProvider FileSystem -Root \\192.168.180.20\PUBLIC\ | Out-Null
Copy-Item -Path source:\Windows.iso -Destination C:\Users\vectrauser\AppData\Local\DwiTools\
Remove-PSDrive source
#unpack
$iso=ls C:\Users\vectrauser\AppData\Local\DwiTools\*.iso
$mount_params = @{ImagePath = $iso; PassThru = $true; ErrorAction = "Ignore"}
$mount = Mount-DiskImage @mount_params
     if($mount) {

         $volume = Get-DiskImage -ImagePath $mount.ImagePath | Get-Volume
         $source = $volume.DriveLetter + ":\*"
         $folder = mkdir C:\Users\vectrauser\AppData\Local\DwiTools\Windows\
        # Write-Host "Extracting '$iso' to '$folder'..."
         $params = @{Path = $source; Destination = $folder; Recurse = $true;}
         cp @params | Out-Null
         $hide = Dismount-DiskImage @mount_params
        # Write-Host "Copy complete"
}
#update
Start-Process C:\Users\vectrauser\AppData\Local\DwiTools\Windows\setup.exe -ArgumentList "/auto upgrade /quiet /noreboot /compat ignorewarning"